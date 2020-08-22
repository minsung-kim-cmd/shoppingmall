package model;

public class OrderL {
	private String lcode;	//시퀸스
	private int ocode;	//시퀸스
	private String cid;		
	private String odate;	//sysdate
	private String odel;	//'n'
	private int ocount;
	private int oprice;
	private String oname;
	private String oaddr;
	private String otel;
	private String omemo;
	private String oinfo;
	
	public String getOinfo() {
		return oinfo;
	}
	public void setOinfo(String oinfo) {
		this.oinfo = oinfo;
	}
	public String getOmemo() {
		return omemo;
	}
	public void setOmemo(String omemo) {
		this.omemo = omemo;
	}
	public String getLcode() {
		return lcode;
	}
	public void setLcode(String lcode) {
		this.lcode = lcode;
	}
	public int getOcode() {
		return ocode;
	}
	public void setOcode(int ocode) {
		this.ocode = ocode;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getOdate() {
		return odate;
	}
	public void setOdate(String odate) {
		this.odate = odate;
	}
	public String getOdel() {
		return odel;
	}
	public void setOdel(String odel) {
		this.odel = odel;
	}
	public int getOcount() {
		return ocount;
	}
	public void setOcount(int ocount) {
		this.ocount = ocount;
	}
	public int getOprice() {
		return oprice;
	}
	public void setOprice(int oprice) {
		this.oprice = oprice;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOaddr() {
		return oaddr;
	}
	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}
	public String getOtel() {
		return otel;
	}
	public void setOtel(String otel) {
		this.otel = otel;
	}
}
