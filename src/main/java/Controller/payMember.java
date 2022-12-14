package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DAO.PayMemberDAO;
import DTO.MemberDTO;
import DTO.PayMemberDTO;

@WebServlet("*.paymem")
public class payMember extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		try {
			if(uri.equals("/payComplete.paymem")) {
				int payGoodsSeq = Integer.parseInt(request.getParameter("payGoodsSeq"));
				String payMemberEmail = request.getParameter("payMemberEmail");
				PayMemberDAO dao = PayMemberDAO.getInstance();
				PayMemberDTO dto = new PayMemberDTO(payGoodsSeq,payMemberEmail,null);
				
				dao.insertPayStatus(dto);
				response.sendRedirect("/updMembership.paymem");
				
			}else if(uri.equals("/updMembership.paymem")) {
				String userEmail = request.getSession().getAttribute("loginEmail").toString();
				PayMemberDAO dao = PayMemberDAO.getInstance();
				dao.updateMembershipStatus(userEmail);
				
				MemberDAO mdao = MemberDAO.getInstance();
				mdao.memberScribe(userEmail);
				MemberDTO dto = mdao.getMypage(userEmail);
				request.getSession().setAttribute("loginMembership", dto.getMembership());
				request.getRequestDispatcher("/start.music").forward(request, response);
			}else if(uri.equals("/refund.paymem")) {
				String userEmail = request.getSession().getAttribute("loginEmail").toString();
				
				PayMemberDAO dao = PayMemberDAO.getInstance();
				dao.refund(userEmail);
				dao.refundDelete(userEmail);
				
				MemberDAO mdao = MemberDAO.getInstance();
				mdao.memberScribeDelete(userEmail);
				MemberDTO dto = mdao.getMypage(userEmail);
				request.getSession().setAttribute("loginMembership", dto.getMembership());
				request.getRequestDispatcher("/start.music").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
