package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.BoardFilesDAO;
import DAO.QnaBoardDAO;
import DAO.QnaCommentDAO;
import DTO.BoardFilesDTO;
import DTO.QnaBoardDTO;
import DTO.QnaCommentDTO;

@WebServlet("*.board")
public class QnaBoard extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		try {
			if (uri.equals("/list.board")) {
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				String qnaWriter = request.getSession().getAttribute("loginEmail").toString();
				QnaBoardDAO dao = QnaBoardDAO.getInstance();
				List<QnaBoardDTO> qna = dao.selectByRange(qnaWriter, cpage * 5 - 4, cpage * 5);
				String navi = dao.getPageNavi(cpage,qnaWriter);
				String nickName = request.getSession().getAttribute("loginNickname").toString();
				request.getSession().setAttribute("nickName", nickName);
				request.setAttribute("qna", qna);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/mypage/myInquiry.jsp").forward(request, response);
			} else if (uri.equals("/insert.board")) {

				int maxSize = 1024 * 1024 * 10;
				String savePath = request.getServletContext().getRealPath("/files");
				// System.out.println(savePath);
				File fileSavePath = new File(savePath);
				if (!fileSavePath.exists()) {
					fileSavePath.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());

				String oriName = multi.getOriginalFileName("file");
				String sysName = multi.getFilesystemName("file");
				
				QnaBoardDAO dao = QnaBoardDAO.getInstance();
				
				String qnaWriter = request.getSession().getAttribute("loginEmail").toString();
				String qnaTitle = multi.getParameter("qnaTitle");
				String qnaContents = multi.getParameter("qnaContents");
				String qnaCategory = multi.getParameter("qnaCategory");
				int qnaSeq = dao.getSeq();
				int result = dao.insert(new QnaBoardDTO(qnaSeq, qnaWriter, qnaTitle, qnaContents, null, qnaCategory));
				if(oriName==null) {
					response.sendRedirect("/list.board?cpage=1");
				}else {
					BoardFilesDAO.getInstance().insert(new BoardFilesDTO(0, oriName, sysName, qnaSeq , null));	
					response.sendRedirect("/list.board?cpage=1");
				}
				
			} else if (uri.equals("/detail.board")) {
				QnaBoardDAO dao = QnaBoardDAO.getInstance();
				int qnaSeq = Integer.parseInt(request.getParameter("qnaSeq"));
				QnaBoardDTO dtoDetail = dao.isSelect(qnaSeq);	
		           
				BoardFilesDAO fileDao = BoardFilesDAO.getInstance();
				BoardFilesDTO dto = fileDao.select(qnaSeq);
				String nickName = request.getSession().getAttribute("loginNickname").toString();
				
				QnaCommentDAO qdao = QnaCommentDAO.getInstance();
				List<QnaCommentDTO> qdto = qdao.selectC(qnaSeq);
				
				request.setAttribute("qdto",qdto);
				request.getSession().setAttribute("nickName", nickName);
				request.setAttribute("fileDto",dto);
				request.setAttribute("dtoDetail", dtoDetail);
				// request.getSession().setAttribute("qnaDetailSeq", qnaSeq);
				request.getRequestDispatcher("/mypage/qnaDetail.jsp").forward(request, response);
			} else if (uri.equals("/adminList.board")) {
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				QnaBoardDAO dao = QnaBoardDAO.getInstance();
				int rcpp = 10;
				int ncpp = 10;
				
				List<QnaBoardDTO> qna = dao.selectAll(cpage * rcpp - (rcpp-1), cpage * rcpp);

				String navi = dao.getPageNaviAll(cpage, rcpp, ncpp);
				request.setAttribute("qna", qna);
				request.setAttribute("navi", navi);
				request.getRequestDispatcher("/admin/adminQnaBoard/adminQna.jsp?cpage=1").forward(request, response);
			} else if (uri.equals("/adminQnaDetail.board")) {
				QnaBoardDAO dao = QnaBoardDAO.getInstance();
				int qnaSeq = Integer.parseInt(request.getParameter("qnaSeq"));
				QnaBoardDTO qnaBoardDto = dao.isSelect(qnaSeq);
				BoardFilesDAO boardFilesDao = BoardFilesDAO.getInstance();
				BoardFilesDTO boardFilesDto = boardFilesDao.select(qnaSeq);
				qnaBoardDto.setQnaSeq(qnaSeq);
				
				List<QnaCommentDTO> qnaCList = QnaCommentDAO.getInstance().selectC(qnaSeq);
				// 댓글 수를 세서, 1개 이상 달려있으면 댓글 잠금 처리한다. (1질문 1답변 원칙)
				int count = qnaCList.size();
				
				request.setAttribute("count", count);
				request.setAttribute("commentList", qnaCList);
				request.setAttribute("boardFile", boardFilesDto);
				request.setAttribute("qnaBoard", qnaBoardDto);
				request.getRequestDispatcher("/admin/adminQnaBoard/adminQnaDetail.jsp?qnaSeq="+qnaSeq).forward(request, response);
	        }
	     } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("/error.jsp");
	     }
	  }

	  protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	     doGet(request, response);
	  }

	}