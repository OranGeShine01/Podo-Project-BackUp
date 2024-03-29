package DTO;

public class MusicDTO {
	
	private String wishEmail;
	
	private int musicSeq;
	private String musicName;
	private String musicArtist;
	private String musicAlbum;
	private String musicImg;
	private String musicMp3;
	private int musicChart;
	private String musicGenre;
	private String musicLylics;
	
	
	
	public String getWishEmail() {
		return wishEmail;
	}
	public void setWishEmail(String wishEmail) {
		this.wishEmail = wishEmail;
	}
	public int getMusicSeq() {
		return musicSeq;
	}
	public void setMusicSeq(int musicSeq) {
		this.musicSeq = musicSeq;
	}
	public String getMusicName() {
		return musicName;
	}
	public void setMusicName(String musicName) {
		this.musicName = musicName;
	}
	public String getMusicArtist() {
		return musicArtist;
	}
	public void setMusicArtist(String musicArtist) {
		this.musicArtist = musicArtist;
	}
	public String getMusicAlbum() {
		return musicAlbum;
	}
	public void setMusicAlbum(String musicAlbum) {
		this.musicAlbum = musicAlbum;
	}
	public String getMusicImg() {
		return musicImg;
	}
	public void setMusicImg(String musicImg) {
		this.musicImg = musicImg;
	}
	public String getMusicMp3() {
		return musicMp3;
	}
	public void setMusicMp3(String musicMp3) {
		this.musicMp3 = musicMp3;
	}
	public int getMusicChart() {
		return musicChart;
	}
	public void setMusicChart(int musicChart) {
		this.musicChart = musicChart;
	}
	public String getMusicGenre() {
		return musicGenre;
	}
	public void setMusicGenre(String musicGenre) {
		this.musicGenre = musicGenre;
	}
	public String getMusicLylics() {
		return musicLylics;
	}
	public void setMusicLylics(String musicLylics) {
		this.musicLylics = musicLylics;
	}
	public MusicDTO(int musicSeq, String musicName, String musicArtist, String musicAlbum, String musicImg,
			String musicMp3, int musicChart, String musicGenre, String musicLylics) {
		super();
		this.musicSeq = musicSeq;
		this.musicName = musicName;
		this.musicArtist = musicArtist;
		this.musicAlbum = musicAlbum;
		this.musicImg = musicImg;
		this.musicMp3 = musicMp3;
		this.musicChart = musicChart;
		this.musicGenre = musicGenre;
		this.musicLylics = musicLylics;
	}
	public MusicDTO() {
	}
	
	//위시리스트 목록 출력
	public MusicDTO(String wishEmail, int musicSeq, String musicName,
			String musicArtist, String musicAlbum, String musicImg) {
		super();
		this.wishEmail = wishEmail;
		this.musicSeq = musicSeq;
		this.musicName = musicName;
		this.musicArtist = musicArtist;
		this.musicAlbum = musicAlbum;
		this.musicImg = musicImg;
	}
	
}
