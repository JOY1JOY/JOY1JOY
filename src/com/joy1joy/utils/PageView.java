package com.joy1joy.utils;


import javax.servlet.jsp.JspWriter;  
import java.io.IOException;  
import java.util.Enumeration;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;  
/** 
 * 通过JSP调用，将分页内容显示到WEB页面。
 * 不支持图片、按钮等，只支持文字。
 * 用法:
 * 在JSP页面按如下形式定义:
 * <% PageView view = new PageView(request,out,page,parameter); %>
 * 按缺省形式显示
 * <% view.setVisible(true); %>
 * 按指定形式显示
 * <% view.setVisible(true,0,1); %>
 */  
public class PageView 
{
  
   /**
    * 当前页面的URL
    */
	private String currentUrl;
 

/**
    * 风格
    */
	private String style;
   /**
    * 在"上一页"两边是否加上"["和"]"
    */
	private boolean useSquareBrackets;
   /**
    * 客户端请求
    */
	private HttpServletRequest request;
   /**
    * 页面输出对象
    */
	private JspWriter out;
   /**
    * WEB页面
    */
	private Page page;
	/**
	 * 传入的pagenum字符串参数
	 */
	private String parameter;

   /**
    * 构造器,创建一个分页内容
	 * @param: request 客户端请求
	 * @param: out 页面输出对象
	 * @param: page WEB页面
    */
	
	public PageView(HttpServletRequest request,JspWriter out,Page page,String parameter)
	{
		this.request = request;
		this.out = out;
		currentUrl = request.getRequestURL().toString();
		this.page = page;
		this.parameter=parameter;
	}

   /**
    * 显示一共有多少行
    */
	private void viewTotal() throws IOException {
		out.print("总数"+ ":" + page.getTotal() + "&nbsp;");
	}
   /**
    * 显示一共有多少页
    */
	private void viewTotalPage() throws IOException {
		out.print("总页数"+ ":" + page.getTotalPage() + "&nbsp;");	
	}
   /**
    * 显示当前是第几页
    */
	private void viewCurrentPage() throws IOException {
		out.print("当前页"+ ":" + page.getCurrentPageNumber() + "&nbsp;");
	}
   /**
    * 显示当前是第几页/一共有多少页
    */
	private void viewTotalAndCurrent() throws IOException {
		out.print(page.getCurrentPageNumber() + "&nbsp;/&nbsp;"+ page.getTotalPage()+ "&nbsp;");
	}
   /**
    * 显示每页有多少行
    */
	private void viewPageSize() throws IOException {
		out.print("每页行数"+ ":" + page.getPageSize() + "&nbsp;");
	}
   /**
    * 显示首页
    */
	private void viewFirstPage() throws IOException {
		if ( useSquareBrackets ) {
			out.print("[");
		}
		out.print("<a href=\""+ currentUrl + "?"+parameter+"=1" + getParamsFromCurrentURL(request,parameter) + "\">");
		out.print("首页"+style+ "</a>");
		if ( useSquareBrackets ) {
			out.print("]");
		}
		out.print("&nbsp;\n");
	}
   /**
    * 显示上一页
    */
	private void viewPreviousPage() throws IOException {
		if ( useSquareBrackets ) {
			out.print("[");
		}
		if( page.hasPreviousPage() ) {
			out.print("<a href=\""+ currentUrl +"?"+parameter+"="+ page.getPreviousPageNumber() + getParamsFromCurrentURL(request,parameter) +"\">");
		}
		out.print("前页"+style);
		if( page.hasPreviousPage() ) { 
			out.print("</a>");
		}
		if ( useSquareBrackets ) {
			out.print("]");
		}
		out.print("&nbsp;\n");
	}
   /**
    * 显示下一页
    */
	private void viewNextPage() throws IOException {
		if ( useSquareBrackets ) {
			out.print("[");
		}
		if( page.hasNextPage() ) {
			out.print("<a href=\""+ currentUrl +"?"+parameter+"="+ page.getNextPageNumber() + getParamsFromCurrentURL(request,parameter) +"\">");
		}
		out.print("后页"+style);
		if( page.hasNextPage() ) {
			out.print("</a>");
		}
		if ( useSquareBrackets ) {
			out.print("]");
		}
		out.print("&nbsp;\n");
	}
   /**
    * 显示尾页
    */
	private void viewLastPage() throws IOException {
		if ( useSquareBrackets ) {
			out.print("[");
		}
		out.print("<a href=\""+ currentUrl +"?"+parameter+"="+ page.getTotalPage() + getParamsFromCurrentURL(request,parameter) +"\">");
		out.print("尾页"+style);
		out.print("</a>");
		if ( useSquareBrackets ) {
			out.print("]");
		}
		out.print("&nbsp;\n");
	}
   /**
    * 显示转到第几页
    */
	private void viewGotoPage() throws IOException {
		out.println("转到"+"<SELECT name=\"jumpPage\" onchange=\"JumpingPage_"+parameter+"('parent',this,0)\">");
		for(int i=1;i<=page.getTotalPage();i++)  {
			if (i== page.getCurrentPageNumber()){
				out.println("&nbsp;&nbsp;<OPTION selected value="+i+">"+i+"</OPTION>");
			}else{
				out.println("&nbsp;&nbsp;<OPTION value="+i+">"+i+"</OPTION>");
			}
		}   
		out.println("</SELECT>");
		//定义javascript方法JumpingPage()
		out.println("<SCRIPT LANGUAGE=\"JavaScript\">");
		out.println("function JumpingPage_"+parameter+"(targ,selObj,restore){");
		out.println("  eval(targ+\".location.href='"+ currentUrl +"?"+parameter+"=\"+selObj.options[selObj.selectedIndex].value+\"" + getParamsFromCurrentURL(request,parameter) + "'\");");
		out.println("  if (restore) selObj.selectedIndex=0;");
		out.println("  return ;");
		out.println("}");
		out.println("</SCRIPT>");
	}

   /**
    * 从URL中获取参数
	 * @param: request 客户端请求
	 * @param: exceptionParamNames 排除在外的参数
    */
	private static String getParamsFromCurrentURL(HttpServletRequest request,String exceptionParamNames){
		String params = "";
       Enumeration e = request.getParameterNames();
outer:
       while (e.hasMoreElements()) {
           String key = (String)e.nextElement();
			StringTokenizer st = new StringTokenizer(exceptionParamNames,",");
			while (st.hasMoreTokens()) {  
			  String exceptionName = st.nextToken();
			  if ( key.equals(exceptionName) ) {
				continue outer;
			  }  
			}  
           String value = request.getParameter(key);
			params += "&" + key + "=" + value;
       }
		return params;
	}

   /**
    * 按缺省形式显示分页内容,如果visible为true,则显示分页内容,
	 * 否则,不显示分页内容
	 * @param: visible 显示开关
    */
	public void setVisible(boolean visible){
		if ( visible ) {
			viewPage(false,0,0);
		}
	}

   /**
    * 按指定形式显示分页内容,如果visible为true,则显示分页内容,
	 * 否则,不显示分页内容
	 * @param: visible 显示开关
	 * @param: style 风格
	 * @param: order 显示顺序
    */
	public void setVisible(boolean visible,int style,int order){
		if ( visible ) {
			viewPage(false,style,order);
		}
	}

	  public String getCurrentUrl() {
			return currentUrl;
		}


		public void setCurrentUrl(String currentUrl) {
			this.currentUrl = currentUrl;
		}
		
		
	/**
    * 按指定形式显示分页内容,如果visible为true,则显示分页内容,
	 * 否则,不显示分页内容
	 * @param: visible 显示开关
	 * @param: useSquareBrackets 是否加上"["和"]"的开关
	 * @param: style 风格
	 * @param: order 显示顺序
    */
	public void setVisible(boolean visible,boolean useSquareBrackets,int style,int order){
		if ( visible ) {
			viewPage(useSquareBrackets,style,order);
		}
	}

   /**
    * 按指定形式显示分页内容
	 * @param: useSquareBrackets 是否加上"["和"]"的开关
	 * @param: style 风格
	 * @param: order 显示顺序
	 * order为0,
	 * 表示完整形式,按如下顺序显示:
	 * 共计:18 分页:2 当前页:1 每页:10 首页 前页 后页 尾页 转到□□□□
	 * order为1,
	 * 表示简洁形式,按如下顺序显示:
	 * 前页 后页 尾页 1/2
	 * order为2,
	 * 表示完整形式2,按如下顺序显示:
	 * 共计:18 每页:10 转到□□□□ 首页 前页 后页 尾页 1/2
    */
	private void viewPage(boolean useSquareBrackets,int style,int order){
		this.useSquareBrackets = useSquareBrackets;
		if ( style == 0) {
			this.style = "";
		}else {
			if ( style > 0 && style < 3 ){
				this.style = "_STYLE"+Integer.toString(style);
			}else{
				this.style = "";
			}
		}
		try {
			switch (order) {
			case 1	:
//				viewFirstPage();
				viewTotal();
				viewPreviousPage();
				viewNextPage();
//				viewLastPage();
				viewTotalAndCurrent();
				break;
			case 2	:
				viewTotal();
				viewTotalPage();
				viewPreviousPage();
				viewNextPage();
				viewTotalAndCurrent();
				viewGotoPage();
				break;
			default:
				viewTotal();
				viewTotalPage();
				viewCurrentPage();
				viewPageSize();
				viewFirstPage();
				viewPreviousPage();
				viewNextPage();
				viewLastPage();
				viewGotoPage();
				break;
			}
				
		}
		catch (IOException e) {
	  		e.printStackTrace();
		}
	}
}
