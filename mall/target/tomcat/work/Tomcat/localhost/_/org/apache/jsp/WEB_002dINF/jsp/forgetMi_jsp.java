/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2019-04-12 10:25:06 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class forgetMi_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/c.tld", Long.valueOf(1548400544000L));
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\"/>\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=9; IE=8; IE=7; IE=EDGE\"/>\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=EmulateIE7\" />\r\n");
      out.write("    <title>设置-忘记密码</title>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/webbase.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" type=\"text/css\" href=\"/css/pages-seckillOrder.css\" />\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/jquery.alerts.css\" />\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/head.css\" />\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/common.css\" />\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/jquery-1.5.1.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/jquery.price_format.2.0.min.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/jquery.alerts.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/cookie.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/shadow.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"/js/common.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/plugins/jquery/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(function(){\r\n");
      out.write("\t$(\"#service\").hover(function(){\r\n");
      out.write("\t\t$(\".service\").show();\r\n");
      out.write("\t},function(){\r\n");
      out.write("\t\t$(\".service\").hide();\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#shopcar\").hover(function(){\r\n");
      out.write("\t\t$(\"#shopcarlist\").show();\r\n");
      out.write("\t},function(){\r\n");
      out.write("\t\t$(\"#shopcarlist\").hide();\r\n");
      out.write("\t});\r\n");
      out.write("\r\n");
      out.write("})\r\n");
      out.write("</script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/plugins/jquery.easing/jquery.easing.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/plugins/sui/sui.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/widget/nav.js\"></script>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "commons/header.jsp", out, false);
      out.write("<!--header-->\r\n");
      out.write("    <div id=\"account\">\r\n");
      out.write("        <div class=\"py-container\">\r\n");
      out.write("            <div class=\"yui3-g home\">\r\n");
      out.write("                <!--左侧列表-->\r\n");
      out.write("                <div class=\"yui3-u-1-6 list\">\r\n");
      out.write("\r\n");
      out.write("                    <div class=\"person-info\">\r\n");
      out.write("                        <div class=\"person-photo\"><img src=\"/images/img/_/photo.png\" alt=\"\"/></div>\r\n");
      out.write("                        <div class=\"person-account\">\r\n");
      out.write("                            <span class=\"safe\">账户安全</span>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"clearfix\"></div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"list-items\">\r\n");
      out.write("\t\t\t\t\t\t<dl>\r\n");
      out.write("\t\t\t\t\t\t\t<dt><i>·</i> 设置</dt>\r\n");
      out.write("\t\t\t\t\t\t\t<dd><a href=\"home-setting-safe.html\" class=\"list-active\" >忘记密码</a></dd>\r\n");
      out.write("\t\t\t\t\t\t</dl>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <!--右侧主内容-->\r\n");
      out.write("                <div class=\"yui3-u-5-6\">\r\n");
      out.write("                    <div class=\"body userSafe\">\r\n");
      out.write("                        <ul class=\"sui-nav nav-tabs nav-large nav-primary \">\r\n");
      out.write("                            <li><a href=\"#two\" data-toggle=\"tab\">验证手机</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                        <div class=\"tab-content \">\r\n");
      out.write("                            <div id=\"two\" class=\"tab-pane active\">\r\n");
      out.write("                                <!--步骤条-->\r\n");
      out.write("                                <div class=\"sui-steps steps-auto\">\r\n");
      out.write("                                    <div class=\"wrap\">\r\n");
      out.write("                                        <div class=\"finished\">\r\n");
      out.write("                                        <label><span class=\"round\"><i class=\"sui-icon icon-pc-right\"></i></span><span>第一步 验证手机号</span></label><i class=\"triangle-right-bg\"></i><i class=\"triangle-right\"></i>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"wrap\">\r\n");
      out.write("                                        <div class=\"todo\">\r\n");
      out.write("                                        <label><span class=\"round\">2</span><span>第二步 更新新的密码</span></label><i class=\"triangle-right-bg\"></i><i class=\"triangle-right\"></i>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"wrap\">\r\n");
      out.write("                                        <div class=\"todo\">\r\n");
      out.write("                                        <label><span class=\"round\">3</span><span>第三步 完成</span></label>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </div>\r\n");
      out.write("\r\n");
      out.write("                                <!--表单-->\r\n");
      out.write("\r\n");
      out.write("                                <form class=\"sui-form form-horizontal sui-validate\" data-toggle='validate' id=\"bind-form\">\r\n");
      out.write("\r\n");
      out.write("                                    <div class=\"control-group\">\r\n");
      out.write("                                        <label for=\"inputPassword\" class=\"control-label\">验证方式：</label>\r\n");
      out.write("                                        <div class=\"controls fixed\">手机验证</div>                            \r\n");
      out.write("                                    </div>\r\n");
      out.write("                                     <div class=\"control-group\">\r\n");
      out.write("                                        <label for=\"inputcode\" class=\"control-label\">手机号：</label>\r\n");
      out.write("                                        <div class=\"controls\">\r\n");
      out.write("                                            <input name=\"phone\" type=\"text\" id=\"phone\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"controls\">\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"control-group\">\r\n");
      out.write("                                        <label for=\"inputRepassword\" class=\"control-label\">短信验证码：</label>\r\n");
      out.write("                                        <div class=\"controls\">\r\n");
      out.write("                                            <input name=\"msgcode\" type=\"text\" id=\"msgcode\"/>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                        <div class=\"controls\">\r\n");
      out.write("                                            <a class=\"sui-btn btn-info\" onclick=\"sendCode()\">发送</a>\r\n");
      out.write("                                        </div>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                    <div class=\"control-group next-btn\">\r\n");
      out.write("                                        <a class=\"sui-btn btn-primary\" onclick=\"nextStep()\">下一步</a>\r\n");
      out.write("                                    </div>\r\n");
      out.write("                                </form>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("    \t//发送验证码\r\n");
      out.write("    \tfunction sendCode() {\r\n");
      out.write("    \t\tvar phone = $(\"#phone\").val();\r\n");
      out.write("\t\t\tif(phone == null || phone == \"\"){\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t//检查手机号符不符规则\r\n");
      out.write("\t\t\tvar preg= /^0[1-9][0-9]{1,2}-[0-9]{7,8}$/;\r\n");
      out.write("\t\t\tvar string = $.trim(phone);\r\n");
      out.write("\t\t\tif(preg.test(string)){\r\n");
      out.write("\t\t\t\t//不符合就结束\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\talert(phone);\r\n");
      out.write("\t\t\t//发送验证码\r\n");
      out.write("            $.ajax({\r\n");
      out.write("\t\t\t\turl : \"http://localhost:8888/user/sendcode/\"+phone,\r\n");
      out.write("            \tsuccess : function(data) {\r\n");
      out.write("\t\t            if (data.status == 200) {\r\n");
      out.write("\t\t            \talert(data.msg);\r\n");
      out.write("\t\t            } else {\r\n");
      out.write("\t\t            \tshowError(\"code\",\"codeErr\",defaultArr[7]);\r\n");
      out.write("\t\t            }\r\n");
      out.write("\t\t          }\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("    \t//下一步\r\n");
      out.write("    \tfunction nextStep() {\r\n");
      out.write("\t\t\t//先验证input框是否为空\r\n");
      out.write("    \t\tvar phone = $(\"#phone\").val();\r\n");
      out.write("\t\t\tif(phone == null || phone == \"\"){\r\n");
      out.write("\t\t\t\talert(\"手机号不能为空\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\tvar msg = $(\"#msgcode\").val();\r\n");
      out.write("\t\t\tif(msg == null || msg == \"\"){\r\n");
      out.write("\t\t\t\talert(\"验证码不能为空\");\r\n");
      out.write("\t\t\t\treturn;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//再验证验证码是否正确\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\turl : \"http://localhost:8888/user/checkcode/\"+msg+\"/\"+phone,\r\n");
      out.write("            \tsuccess : function(data) {\r\n");
      out.write("\t\t            if (data.status == 200) {\r\n");
      out.write("\t\t           \t\t//正确，跳转到下一步\r\n");
      out.write("\t\t            \twindow.location.href =\"http://localhost:8888/login/forgetNext/\"+phone;\r\n");
      out.write("\t\t            } else {\r\n");
      out.write("\t\t            \tshowError(\"code\",\"codeErr\",defaultArr[7]);\r\n");
      out.write("\t\t            }\r\n");
      out.write("\t\t          }\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t}\r\n");
      out.write("\t</script>\r\n");
      out.write("    <!-- 底部栏位 -->\r\n");
      out.write("    <!-- footer start -->\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "commons/footer.jsp", out, false);
      out.write("<!-- footer end -->\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
