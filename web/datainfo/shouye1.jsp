<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="SQLBean.JifenBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="SQLBean.StudentBean"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="baidu-site-verification" content="6YqIY6aMPK" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>IT课堂</title>
    <link rel="shortcut icon" href="<%=basePath %>images/lo.png" type="image/x-icon">	
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/base.css?v=2.4.4">
    <link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/index/base.css?v=3.2.11">
	<link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/index/style.css?v=3.2.11">
	<script type="text/javascript" src="https://static1.51cto.com/edu/index/js/jquery.js"></script>
	<script type="text/javascript" src="https://static1.51cto.com/edu/js/allpageevent.js?v=2.4.4"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.1.min.js"></script>
	<script type="text/javascript">
	var web_url = 'http://edu.51cto.com/',
		css_url = 'https://static1.51cto.com/edu/index/',
		js_url  = 'https://static1.51cto.com/edu/index/js/',
		img_url = 'https://static1.51cto.com/edu/index/images/',
		home_url= 'http://home.51cto.com/',
		exam_url= 'http://edu.51cto.com/t/';
    var big_index = true	</script>
    <!-- 通用顶部简导航 -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>/css/top.css">
    <link rel="stylesheet" type="text/css" href="https://static1.51cto.com/edu/css/gen_top.css?v=2.2.80">
    <script type="text/javascript" src="https://static1.51cto.com/edu/js/gen_top.js?v=2.2.80"></script>
</head>
<body>
 <% 
	StudentBean studentBean = (StudentBean)session.getAttribute("bean");
	int num=0;
	if(session.getAttribute("num")!=null){
		num = Integer.parseInt(session.getAttribute("num").toString());
	}
	JifenBean jifen = (JifenBean)session.getAttribute("jifenBean");
%>
<!-- 通用顶部导航 -->
<div class="GenTopHeader" style="margin-top: 0px;">
    <ul class="Page"  id="GenTopBar"><li class="fl f14" id="Til">中 国 最 大 的 IT 技 能 学 习 平 台</li>
        <li class="fr navi"><a  target="_blank" style="background-color:none;">网站导航</a>
            <ul class="navigates">
                <li><a href="<%=basePath %>courselistservlet?order=list" target="_blank">首页</a></li>
                <li><a href="<%=basePath %>datainfo/login.jsp" target="_blank">登录界面</a></li>
                <li style="border-bottom: 1px solid #FFF;"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册界面</a></li>
                <c:if test="<%=studentBean!=null %>">
                	<li><a href="<%=basePath %>studentservlet?order=teacher&studentname=${studentbean.studentname}" target="right">申请开课</a></li>
                	<li><a href="<%=basePath %>datainfo/myface.jsp" target="_blank">个人主页</a></li>
                </c:if>
            </ul>
        </li>
       	<c:if test="<%=studentBean!=null %>">
       		<c:if test="<%=studentBean.getVIP()==1 %>">
	        	<li class="fr apps"><a href="<%=basePath %>datainfo/app.jsp" target="_blank" style="background:none;">会员专区</a>
		            <ul>
		                <li><a href="<%=basePath %>snack/snack.jsp" target="_blank">贪吃蛇</a></li>
		                <li><a href="<%=basePath %>3Dquanwang/demo.html" target="_blank"><span id="openmusic">3D拳王</span></a></li>
		                <li><a href="<%=basePath %>taiqiuyouxi/index.html" target="_blank">台球游戏</a></li>
		            	<li><a href="<%=basePath %>fivechess/index.html" target="_blank">五子棋</a></li>
		            	
		            </ul>
	        	</li>
        	</c:if>
       	</c:if>
        <c:if test="${studentBean!=null}">
        	<li class="fr"><a target="_blank" href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>">学习中心</a></li>
        </c:if>
        <li class="fr apps"><a href="<%=basePath %>datainfo/app.jsp" target="_blank" style="background:none;">课堂APP</a>
            <ul>
                <li><a  target="_blank">Android</a></li>
                <li><a  target="_blank">iPhone</a></li>
                <li><a  target="_blank">iPad</a></li>
            </ul>
        </li>
        <li class="fr" id="TopCart">
            <a href="<%=basePath %>courselistservlet?order=mycar1" target="_blank" class="red">购物车<span><%=num %></span></a>
        </li>
        <li class="fr reg"><a href="<%=basePath %>datainfo/zhuce.jsp" target="_blank">注册</a></li>
        <c:if test="${studentBean==null}">
        	<li class="fr"><a href="<%=basePath %>datainfo/login.jsp">登录</a></li>
        </c:if>
       <c:if test="${studentBean!=null}">
       		 <li class="fr"><a href="<%=basePath %>loginservlet?order=exit">安全退出</a></li>
       		 <c:if test="<%=studentBean.getVIP()!=1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vip_grey2.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%"/></a></li>
       		 </c:if>
       		 <c:if test="<%=studentBean.getVIP()==1 %>">
       		 	<li class="fr reg"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>" target="_blank"><%=studentBean.getStudentname() %>&nbsp;<img src="<%=basePath %>images/vipred.png" style="float: right; margin-top: 13px;height:20px;width:20px;border-radius:50%"/></a></li>
       		 </c:if>
       </c:if>
    </ul>
</div><!-- 顶部广告位 -->
<div class="Page adverTop">
    <a href="<%=basePath %>huiyuanservlet?order=list&n=n" target="_blank">
    <img src="<%=basePath %>images/20170515.png">
    </a>
  </div>
<div class="Page Top">
    <div class="fl Logo">
        <img src="<%=basePath %>image/itlogo.png" class="fl">
        <img src="https://static1.51cto.com/edu/index/images/sublogo01.png" class="fl mt5" style="margin-left: 25px;">
    </div>
    <div class="fr Search">
        <form action="<%=basePath %>courselistservlet?order=shousuo" method="post">
            <button type="submit" class="fr" >搜索</button>
            <input type="text" class="fr"  name="sousuo" placeholder="找课程、找讲师" >
            <div class="fr Select" id="SearchSelect">
                <p>视频课程</p>
                <ul>
                    <li>视频课程</li>
                    <li>微职位培训</li>
                    <li>讲师</li>
                </ul>
            </div>
            <div class="hotKey">
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">C语言</a>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">java</a>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">jsp</a>
            </div>
        </form>
    </div>
    <div class="clear"></div>
</div>
<div class="Page NavTop Navs">
    <div class="fl Left">学习直通车</div>
    <ul class="fl">
        <li><a target="_blank" href="<%=basePath %>findcourselistservlet?order=list">微职位培训</a></li>
        <li><a target="_blank" >视频课程</a></li>
        <li><a target="_blank" >套餐</a></li>
        <li><a target="_blank" >职业路线图</a></li>
        <li><a target="_blank" >企业学习</a></li>
        <li><a target="_blank" >免费试听</a></li>
        <li>
          <p class="more">线下学习</p>
          <div class="more">
              <a target="_blank" >IT训练营</a>
              <a target="_blank" >IT峰会</a>
              <a target="_blank" >IT集训</a>
          </div>
        </li>
        <!-- <li><a target="_blank" href="http://edu.51cto.com/activity/lists/id-23.html?dh">企业培训</a></li> -->
        <!-- <li><a target="_blank" href="http://edu.51cto.com/activity/lists/id-10.html">学院APP</a></li> -->
    </ul>
    <div class="clear"></div>
</div>
<div class="Navs NavBanner IndexBanner">
    <div class="Page">
        <ul class="Left">
               <li class="first" >
                <h2>
                    <b>系统/运维 </b>
                   ·<b> 大数据</b>
                </h2>
                <p>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="">${courseBean1.course_name}</a>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="new">深度学习</a>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="red">学习吧！</p>
                <div class="More">
                    <dl>
                        <dt>分类</dt>
                        <dd>
                            <p>
  	                       		<a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="blue">深度学习</a>
		                </dd>
                        	<dt>微职位培训</dt>
                        <dd>
                        	<p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="red">【高薪】${courseBean1.one_word}</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="red">【付费】百万年薪大数据工程师课程</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" >【热门】Windows全能工程师高端培训</a></p>
                        </dd>
                        <dt>职业路线图/套餐</dt>
                        <dd>
                         	<p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" >${courseBean1.course_name}数据库高级工程师培训线路图上部</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" >嵌入式软件工程师职业学习路线图</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" >高薪${courseBean1.course_name}运维架构师之路-自动化运维助你实现月薪15k+</a></p>
                        </dd>
                     </dl>
                 <div class="ad"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img src="${courseBean1.picture_url}"></a></div>
                 <div class="White"></div>
                </div>
    		</li>
        	<li>
                <h2>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">编程语言 </a>
                     · <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"> ${courseBean2.course_name}</a></h2>
                <p>
	                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" class="hot">c++</a>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" class="">PHP</a>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" class="">Java</a>
               </p>
                <div class="More">
                    <dl>
                        <dt>分类</dt>
                        <dd>
                            <p>
                               </p>
                               <p>
		                	  <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" class="red" title="PHP">PHP</a>
                            
		                    </p>
		                    </dd>
                        <dt>微职位培训</dt>
                        <dd>
                          	 <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" class="red">上班族${courseBean2.course_name}培训，6878人已报名&gt;点击了解</a></p>
                             <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" >【付费】高端${courseBean2.course_name}工程师培训，为职场助力</a></p>
                             <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" >4个月转身${courseBean2.course_name}工程师&gt;&gt;月薪20K起</a></p>
                         </dd>
                          <dt>职业路线图/套餐</dt>
  <dd>
  	                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" >Web前端工程师职业学习路线图</a></p>
                                <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" >PHP开发工程师从入门到精通学习路线图</a></p>
                                <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" >Java高级程序员修炼之道——职业学习路线图</a></p>
                              </dd>
                              </dl>
                          <div class="ad"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img src="${courseBean2.picture_url}"></a></div>
                          <div class="White"></div>
                </div>
    		</li>
        	<li>
                <h2>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">移动开发 </a>
                     · <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"> ${courseBean.course_name}</a>                </h2>
                <p>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="">前段测试</a>
                                            <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="new">Unity3D</a>
                        <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="">移动测试</a>
                                    </p>
                <div class="More">
                    <dl>
                        <dt>分类</dt>
                        <dd>
                            <p>
		                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="" title="其他">其他</a>
                             </p>
                             <p>
		                	 <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="" title="Unity3D">Unity3D</a>
		                    </p>                        </dd>
                        <dt>微职位培训</dt>
						<dd>
                           <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" >【火爆】4个月成为${courseBean3.course_name}开发工程师&gt;&gt;查看详情</a></p>
                           <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="red">【付费】${courseBean3.course_name}开发工程师高端课程&gt;&gt;开始学习</a></p>
                           <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" >【热门】${courseBean3.course_name}开发工程师高端就业课程&gt;&gt;30K起</a></p>
                        </dd>
                        <dt>职业路线图/套餐</dt>
						<dd>
	                           <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" >测试工程师（初级-&gt;高级-&gt;实战）职业学习路线图</a></p>
                               <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" >HTML5从零基础到实战视频教程</a></p>
                               <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" >Swift开发工程师职业学习路线图</a></p>
                           </dd>
                        </dl>
                        <div class="ad"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img src="${courseBean3.picture_url}"></a></div>
                        <div class="White"></div>
                </div>
    		</li>
        	<li  >
                <h2>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank">考试认证 </a>
                     · <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"> ${courseBean4.course_name}</a>                </h2>
                <p>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" class="">了解详情</a>
                                            <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" class="">网络管理</a>
                        <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" class="">红帽认证</a>
                                    </p>
                <div class="More">
                    <dl>
                        <dt>分类</dt>
                        <dd>
                            <p>
                             </p>
                             <p>
		                    </p>
        			</dd>
                    <dt>微职位培训</dt>
						<dd>
                           <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" class="red">【保过】零基础签约100%一次过软考&gt;&gt;了解</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" >【保过】华为HCNP认证100%取证班&gt;&gt;了解</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" >【官方】红帽认证签约保过班&gt;&gt;点击咨询</a></p>
                         </dd>
                    <dt>职业路线图/套餐</dt>
						<dd>
	                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" >CCIE课程套餐（CCNA/CCNP/CCIE入门到精通）</a></p>
                                <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" >华为HCNA和HCNP整套精讲视频套餐</a></p>
                                <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" >备战2016软考网络工程师10套真题详解套餐</a></p>
                            </dd>
                    </dl>
                      <div class="ad"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"><img src="${courseBean4.picture_url}"></a></div>
                      <div class="White"></div>
                </div>
    		</li>
        	<li>
                <h2>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">${courseBean5.course_name} </a>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"> Office办公</a>                </h2>
                <p>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="">MySQL</a>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="">Excel</a>
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="">Oracle</a>
                </p>
                <div class="More">
                    <dl>
                        <dt>分类</dt>
                        <dd>
                            <p>
                             </p>
                             <p>
		                    </p> 
						</dd>
                        <dt>微职位培训</dt>
						<dd>
	                       <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="red">【热门】4个月成为虚拟化与云计算工程师</a></p>
	                       <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" >【付费】虚拟化与云计算工程师高端培训</a></p>
	                       <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" >【高薪】虚拟化与云计算工程师高薪就业班</a></p>
                        </dd>
                        <dt>职业路线图/套餐</dt>
                        <dd>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" >深度学习原理与实战视频课程套餐</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" >${courseBean5.one_word}（Java+Hadoop）</a></p>
                            <p><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" >${courseBean5.course_name}从入门到VBA高级工程师学习路线图</a></p>
                        </dd>
                    </dl>
                        <div class="ad"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"><img src="${courseBean5.picture_url}"></a></div>
                        <div class="White"></div>
                </div>
    		</li>
        	        </ul>
         <div class="Login" style="height:385px;marge-top:0px">
            <div class="UserInfo">
                <c:if test="${studentBean!=null}">
                	<div class="Avatar">
                    	<a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>"><img src="<%=basePath%><%=studentBean.getStudentface() %>" id="UserAvatar" style="width:70px;height:70px; border-radius:50%;margin-top:10px;margin-left:0px"></a>
                    	<img src="<%=basePath %>images/avatar.png" >
               	 	</div>
                </c:if>
                <c:if test="${studentBean==null}">
                	<div class="Avatar">
                    	<img src="<%=basePath %>image/face.gif" id="UserAvatar" style="width:70px;height:70px; border-radius:50%;margin-top:5px;margin-left:0px">
               	 	</div>
                </c:if>
                <div class="Main">
                    <c:if test="${studentBean!=null}">
                    	<c:if test="<%=jifen!=null %>">
                    		<h3 id="UserName" class="oneLine"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>"><%=studentBean.getStudentname() %>&nbsp;&nbsp;|&nbsp;&nbsp;积分：<font color="red" size="3"><%=jifen.getFen() %></font></a></h3>
                    	</c:if>
                    	<c:if test="<%=jifen==null %>">
                    		<h3 id="UserName" class="oneLine"><a href="<%=basePath %>loginservlet?order=loginin&name=<%=studentBean.getStudentmobile() %>"><%=studentBean.getStudentname() %>&nbsp;&nbsp;|&nbsp;&nbsp;积分：<font color="red" size="3">无</font></a></h3>
                    	</c:if>
                    </c:if>
                    <c:if test="${studentBean==null}">
                		<div class="Btns" id="BannerBtn">
                    		<p id="UserScore"><font size="3">领取520元新人大礼包</font></p>
                		</div>
                	</c:if>
                	 <c:if test="${studentBean!=null}">
                		<div class="Btns" id="BannerBtn">
                    	<p id="UserScore">账号：${studentBean.studentmobile}</p><p id="UserScore">余额：<font color="red">￥${moneybean.summoney}</font></p>
                		</div>
                	</c:if>
                </div>
                <div class="clear"></div>
                <c:if test="${studentBean==null}">
                	<div class="Btns" id="BannerBtn">
                    	<a href="<%=basePath %>datainfo/login.jsp" class="login fl" id="loginBtn">登录</a>
                   	 	<a href="<%=basePath %>datainfo/zhuce.jsp" class="register fr">注册</a>
                	</div>
                </c:if>
            </div>
            <ul class="NewsList">
            	<li style="margin-left:8px"><h3 align="center">热&nbsp;&nbsp;门&nbsp;&nbsp;课&nbsp;&nbsp;程</h3></li>
                <c:forEach items="${courselist}" var="s">
                	<c:if test="${s.ismoney==0}">
                		<li><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${s.sectionid}&courseid=${s.course_id}" target="_blank" class="blue" title="【免费】2017Linux高端课程">【免费】${s.course_name}&nbsp;&nbsp;&nbsp;&nbsp;${s.one_word}</a></li>
                	</c:if>
                	<c:if test="${s.ismoney==1}">
                		<li><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${s.sectionid}&courseid=${s.course_id}" target="_blank"  title="【收费】2017Linux高端课程">【付费】${s.course_name}&nbsp;&nbsp;&nbsp;&nbsp;${s.one_word}</a></li>
                	</c:if>
                </c:forEach>
                 <li><a href="javascript:void(0);" target="_blank"  class="blue"  title="【头条】半年会员+学院余额送送送！">【头条】半年会员+学院余额送送送！</a></li>
                 <li><a href="javascript:void(0);" target="_blank"  title="【火爆】Python>>自动化|全栈|爬虫">【火爆】Python>>自动化|全栈|爬虫</a></li>
                 <li><a href="javascript:void(0);" target="_blank"  class="blue"  title="【大咖】面向测试工程师的Python学习">【大咖】面向测试工程师的Python学习</a></li>
                 <li><a href="javascript:void(0);" target="_blank"  title="【折扣】Linux云计算与架构师课程">【折扣】Linux云计算与架构师课程</a></li>
                 <li><a href="javascript:void(0);" target="_blank"  class="blue"  title="【系列】51单片机高级外设和项目篇">【系列】51单片机高级外设和项目篇</a></li>
            </ul>
        </div>
        <div class="Banner">
            <div class="IndexBannerPics">
                <ul class="IndexBannerPicsList">
                     <li color="#fc785f"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank"><img src="<%=basePath %>image/bg_1.jpg" alt="Linux"></a></li>
                     <li color="#2F6946"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"><img src="<%=basePath %>image/bg_2.jpg" alt="产品经理直播课"></a></li>
                     <li color="#000000"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank"><img src="<%=basePath %>image/bg_3.jpg" alt="大数据"></a></li>
                     <li color="#030807"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"><img src="<%=basePath %>image/bg_4.jpg" alt="覃秉丰"></a></li>
                     <li color="#2e73ac"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"><img src="<%=basePath %>image/bg_5.jpg" alt="python"></a></li>
                     <!--轮播图-->
                </ul>
                <a href="javascript:void(0);" class="fl IBPB_L"></a>
                <a href="javascript:void(0);" class="fr IBPB_R"></a>
                <ul class="IndexBannerPicsList_Btn">
                    <li class="IBPLBs_Iemt IBPLBs_IemtCur"></li>
                    <li class="IBPLBs_Iemt "></li>
                    <li class="IBPLBs_Iemt "></li>
                    <li class="IBPLBs_Iemt "></li>
                    <li class="IBPLBs_Iemt "></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="Lists">
    <div class="Page">
        <!-- 课程入口 end -->
        <!-- 培训班 -->
        <div class="Til">
            <p><a target="_blank" >精品课程</a></p>
        </div>
        <a href="<%=basePath %>courselistservlet?order=list" target="_blank"><img src="https://static1.51cto.com/edu/index/images/index_til1.2.png"></a>
        <ul class="List ListPXB">
        	<c:forEach items="${courselist}" var="s">
        		<li>
	               	<a href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}" target="_blank" class="picDiv"><img src="${s.picture_url}" style="height:250px;"  alt="${s.one_word}"><img src="${s.picture_url}" class="picMask"  title="${s.one_word}"  alt="${s.one_word}"></a>
	                <h2 class="oneLine"><a href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}" target="_blank" title="${s.one_word}">${s.one_word}</a></h2>
	                <c:if test="${s.ismoney!=1}">
	                	<p class="c9"><a href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}" target="_blank" title="${s.one_word}">${s.course_name}&nbsp;20周共 ${s.course_count} 节课</a>&nbsp;<font color="red">【免费】</font>&nbsp;&nbsp;<font color="blue">【可加入会员】</font></p>
	                </c:if>
	                <c:if test="${s.ismoney==1}">
	                	<p class="c9"><a href="<%=basePath %>courselistservlet?order=datainfo&courseid=${s.course_id}" target="_blank" title="${s.one_word}">${s.course_name}&nbsp;20周共 ${s.course_count} 节课</a>&nbsp;<b style="align:right"><font color="red">【付费】</font>&nbsp;&nbsp;<font color="blue">【可加入会员】</font></b></p>
	                </c:if>
            	</li>
        	</c:forEach>
        </ul>
        <!-- 职业路线图 -->
        <div class="Til">
            <p>职业路线图</p>
        </div>
        <ul class="List ListRP">
       		<li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201702/3852bd61454dd6813b76667b0f8752212602fc.png" alt="Java高级工程师职业学习路线图">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="Java高级工程师职业学习路线图" alt="Java高级工程师职业学习路线图">
                </a>
                <h2 class="oneLine" title="Java高级工程师职业学习路线图"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">Java高级工程师职业学习路线图</a></h2>
            </li>
        <li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201612/28fa10163e0e46d95e6827f13a1445703f6db9.jpg" alt="互联网数据分析师学习路线图 （助你精通Google Analytics+SPSS +Tableau）">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="互联网数据分析师学习路线图 （助你精通Google Analytics+SPSS +Tableau）" alt="互联网数据分析师学习路线图 （助你精通Google Analytics+SPSS +Tableau）">
                </a>
                <h2 class="oneLine" title="互联网数据分析师学习路线图 （助你精通Google Analytics+SPSS +Tableau）"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank">互联网数据分析师学习路线图 （助你精通Google Analytics+SPSS +Tableau）</a></h2>
            </li>
             <li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201611/f6975d757bb555da81b2853bc7de0a73e38ef1.jpg" alt="思科认证网络专家（CCNA-&gt;CCNP-&gt;CCIE）职业学习路线图">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="思科认证网络专家（CCNA-&gt;CCNP-&gt;CCIE）职业学习路线图" alt="思科认证网络专家（CCNA-&gt;CCNP-&gt;CCIE）职业学习路线图">
                </a>
                <h2 class="oneLine" title="思科认证网络专家（CCNA-&gt;CCNP-&gt;CCIE）职业学习路线图"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank">思科认证网络专家（CCNA-&gt;CCNP-&gt;CCIE）职业学习路线图</a></h2>
            </li>
                    	<li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201611/336ffc40033b500bd0561904b8a359fe69e350.jpg" alt="Oracle DBA数据库高级工程师培训线路图上部（项目实施+备份恢复+基础深入）">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="Oracle DBA数据库高级工程师培训线路图上部（项目实施+备份恢复+基础深入）" alt="Oracle DBA数据库高级工程师培训线路图上部（项目实施+备份恢复+基础深入）">
                </a>
                <h2 class="oneLine" title="Oracle DBA数据库高级工程师培训线路图上部（项目实施+备份恢复+基础深入）"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank">Oracle DBA数据库高级工程师培训线路图上部（项目实施+备份恢复+基础深入）</a></h2>
            </li>
                    	<li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201612/64c204d99c7affaf9673942f181c2b1654bec2.jpg" alt="企业Linux高薪运维实战工程师职业学习路线图">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="企业Linux高薪运维实战工程师职业学习路线图" alt="企业Linux高薪运维实战工程师职业学习路线图">
                </a>
                <h2 class="oneLine" title="企业Linux高薪运维实战工程师职业学习路线图"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">企业Linux高薪运维实战工程师职业学习路线图</a></h2>
            </li>
                    	<li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201612/592ef0b525b23391d5f210a1c8bf3403c2b195.jpg" alt="Android开发工程师职业学习路线图">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="Android开发工程师职业学习路线图" alt="Android开发工程师职业学习路线图">
                </a>
                <h2 class="oneLine" title="Android开发工程师职业学习路线图"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">Android开发工程师职业学习路线图</a></h2>
            </li>
                    	<li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201612/94ffc38495bb0ffc379314627cd3cd04db0abf.jpg" alt="Web前端工程师职业学习路线图">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="Web前端工程师职业学习路线图" alt="Web前端工程师职业学习路线图">
                </a>
                <h2 class="oneLine" title="Web前端工程师职业学习路线图"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">Web前端工程师职业学习路线图</a></h2>
            </li>
                    	<li>
                <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv">
                    <img src="https://s1.51cto.com/images/201611/424897186bc1ac10c7c742d4c365c4e85dd685.jpg" alt="vSphere企业运维（入门到提高）学习路线图">
                    <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask"  title="vSphere企业运维（入门到提高）学习路线图" alt="vSphere企业运维（入门到提高）学习路线图">
                </a>
                <h2 class="oneLine" title="vSphere企业运维（入门到提高）学习路线图"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank">vSphere企业运维（入门到提高）学习路线图</a></h2>
            </li>
                    </ul>
                        <!-- 每日优惠 -->
        <div class="Til">
            <p>每日优惠</p>
        </div>
        <ul class="List ListCourse">
        	            <li>
                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="picDiv" title="WebGL 实战视频课程（基础篇）">
                        <img src="https://s1.51cto.com/images/201507/735be46332bf37024a212813ffc86d00465527_big.jpg">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" title="WebGL 实战视频课程（基础篇）">WebGL 实战视频课程（基础篇）</a></h2>
                    <div>
                        <p class="red">¥<span class="fb">179</span></p>
                        <p class="del c9">¥<span class="fa">199</span></p>
                        <p class="disc"><span>9</span>折</p>
                        <div class="clear"></div>
                    </div>
                    <h4 class="c9">
                        <span>共19课时</span>
                        <span>·</span>
                        <span>1513人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" class="picDiv" title="Excel VBA 基础及编程领域经典难点问题- Excel VBA 代码实现视频课程">
                        <img src="https://s1.51cto.com/images/201702/519a5aa645d144070348368ad635d9b1701230_big.jpg">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank" title="Excel VBA 基础及编程领域经典难点问题- Excel VBA 代码实现视频课程">Excel VBA 基础及编程领域经典难点问题- Excel VBA 代码实现视频课程</a></h2>
                    <div>
                        <p class="red">¥<span class="fb">139</span></p>
                        <p class="del c9">¥<span class="fa">199</span></p>
                        <p class="disc"><span>7</span>折</p>
                        <div class="clear"></div>
                    </div>
                    <h4 class="c9">
                        <span>共15课时</span>
                        <span>·</span>
                        <span>1232人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="picDiv" title="Microsoft Excel 2013数据分析实战演练视频课程">
                        <img src="https://s1.51cto.com/images/201511/49e50fd96f387bd966e578e08ca6ad8fb8702a_big.jpg">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" title="Microsoft Excel 2013数据分析实战演练视频课程">Microsoft Excel 2013数据分析实战演练视频课程</a></h2>
                    <div>
                        <p class="red">¥<span class="fb">15</span></p>
                        <p class="del c9">¥<span class="fa">19</span></p>
                        <p class="disc"><span>8.3</span>折</p>
                        <div class="clear"></div>
                    </div>
                    <h4 class="c9">
                        <span>共23课时</span>
                        <span>·</span>
                        <span>3476人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="CodeIgniter框架PHP经典框架讲解视频课程【闫涛】">
                        <img src="https://s1.51cto.com/images/201702/4805c181534c57680950920354dc5ad265b175_big.png">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" title="CodeIgniter框架PHP经典框架讲解视频课程【闫涛】">CodeIgniter框架PHP经典框架讲解视频课程【闫涛】</a></h2>
                    <div>
                        <p class="red">¥<span class="fb">10</span></p>
                        <p class="del c9">¥<span class="fa">18</span></p>
                        <p class="disc"><span>6</span>折</p>
                        <div class="clear"></div>
                    </div>
                    <h4 class="c9">
                        <span>共21课时</span>
                        <span>·</span>
                        <span>21人学习</span>
                    </h4>
                </div>
            </li>
                    </ul>
                <div class="clear"></div>
    </div>
</div>
<!-- 优质好课 (Tab 切换) -->
<div class="tabs Lists">
    <div class="Page">
        <div class="Til">
            <p class="fl"><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank">优质好课</a></p>
            <ul class="tabs fl" id="tabs">
            	                <li class="cur">系统/运维</li>
                                <li >考试认证</li>
                                <li >云计算</li>
                                <li >编程语言</li>
                                <li >软件研发</li>
                                <li >Office</li>
                            </ul>
            <div class="clear"></div>
        </div>
    </div>
    <div class="Page">
    	        <ul class="List ListCourse tablist" style="display: block;">
        	            <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean1.sectionid}&courseid=${courseBean1.course_id}" target="_blank" class="picDiv" title="2017跟老男孩学Linux运维视频课程：Shell编程实战书籍视频-第1-20章">
                        <img src="https://s1.51cto.com/images/201701/b7854f46136bc7266ee572d783ebce7d40f4b3_big.png" alt="2017跟老男孩学Linux运维视频课程：Shell编程实战书籍视频-第1-20章">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean2.sectionid}&courseid=${courseBean2.course_id}" target="_blank"  title="2017跟老男孩学Linux运维视频课程：Shell编程实战书籍视频-第1-20章">2017跟老男孩学Linux运维视频课程：Shell编程实战书籍视频-第1-20章</a></h2>
                    <h4 class="c9">
                        <span>共108课时</span>
                        <span>·</span>
                        <span>1575人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean3.sectionid}&courseid=${courseBean3.course_id}" target="_blank" class="picDiv" title="微软活动目录（Active Directory）实战【第三季】：单域多站点视频课程">
                        <img src="https://s1.51cto.com/images/201702/c12160f44d0055595d5446ffcf3a66a8c18712_big.jpg" alt="微软活动目录（Active Directory）实战【第三季】：单域多站点视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"  title="微软活动目录（Active Directory）实战【第三季】：单域多站点视频课程">微软活动目录（Active Directory）实战【第三季】：单域多站点视频课程</a></h2>
                    <h4 class="c9">
                        <span>共34课时</span>
                        <span>·</span>
                        <span>273人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="红帽RHCSA题库讲解视频课程【2017最新录制】">
                        <img src="https://s1.51cto.com/images/201702/f17b2cc163a4ce56ed9175637860823e3d2c82_big.jpg" alt="红帽RHCSA题库讲解视频课程【2017最新录制】">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="红帽RHCSA题库讲解视频课程【2017最新录制】">红帽RHCSA题库讲解视频课程【2017最新录制】</a></h2>
                    <h4 class="c9">
                        <span>共4课时</span>
                        <span>·</span>
                        <span>155人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Windows Powershell WMI 集成实战视频课程">
                        <img src="https://s1.51cto.com/images/201702/3433f249315b1fb280421409424a1541ba879e_big.jpg" alt="Windows Powershell WMI 集成实战视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Windows Powershell WMI 集成实战视频课程">Windows Powershell WMI 集成实战视频课程</a></h2>
                    <h4 class="c9">
                        <span>共7课时</span>
                        <span>·</span>
                        <span>20人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Zabbix监控平台应用实战视频课程（配置文件+模式监控+实战案例）">
                        <img src="https://s1.51cto.com/images/201608/195b9b450102fe788d91536fce444d7a79eee7_big.png" alt="Zabbix监控平台应用实战视频课程（配置文件+模式监控+实战案例）">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Zabbix监控平台应用实战视频课程（配置文件+模式监控+实战案例）">Zabbix监控平台应用实战视频课程（配置文件+模式监控+实战案例）</a></h2>
                    <h4 class="c9">
                        <span>共20课时</span>
                        <span>·</span>
                        <span>4797人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Linux安装详解实战视频课程（硬盘安装+FTP+NFS+Samba+TFTP）">
                        <img src="https://s1.51cto.com/images/201701/f39182c205596466a0d550876aa0de8bfb714c_big.jpg" alt="Linux安装详解实战视频课程（硬盘安装+FTP+NFS+Samba+TFTP）">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Linux安装详解实战视频课程（硬盘安装+FTP+NFS+Samba+TFTP）">Linux安装详解实战视频课程（硬盘安装+FTP+NFS+Samba+TFTP）</a></h2>
                    <h4 class="c9">
                        <span>共7课时</span>
                        <span>·</span>
                        <span>1590人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="网络安全工程师（第二部分）_Linux快速入门视频课程">
                        <img src="https://s1.51cto.com/images/201611/6442f98600f0c35c23b644c71cdebf4d62443e_big.jpg" alt="网络安全工程师（第二部分）_Linux快速入门视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="网络安全工程师（第二部分）_Linux快速入门视频课程">网络安全工程师（第二部分）_Linux快速入门视频课程</a></h2>
                    <h4 class="c9">
                        <span>共63课时</span>
                        <span>·</span>
                        <span>2966人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Linux 企业高级管理（基本配置+网络管理）视频课程-基础篇（上）">
                        <img src="https://s1.51cto.com/images/201611/490592a69821aa0c8955571328fc4bff74d73c_big.jpg" alt="Linux 企业高级管理（基本配置+网络管理）视频课程-基础篇（上）">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Linux 企业高级管理（基本配置+网络管理）视频课程-基础篇（上）">Linux 企业高级管理（基本配置+网络管理）视频课程-基础篇（上）</a></h2>
                    <h4 class="c9">
                        <span>共16课时</span>
                        <span>·</span>
                        <span>362人学习</span>
                    </h4>
                </div>
            </li>
                    </ul>
                <ul class="List ListCourse tablist" >
        	            <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="2017软考信息安全工程师基础知识视频课程（上）">
                        <img src="https://s1.51cto.com/images/201701/a8e127308da23802d9d345574ee8b77b718697_big.png" alt="2017软考信息安全工程师基础知识视频课程（上）">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="2017软考信息安全工程师基础知识视频课程（上）">2017软考信息安全工程师基础知识视频课程（上）</a></h2>
                    <h4 class="c9">
                        <span>共101课时</span>
                        <span>·</span>
                        <span>12920人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="【直播QQ群511720801】2017软考信息系统项目管理师-考前冲刺重难点解析">
                        <img src="https://s1.51cto.com/images/201701/b38db5a78f530e1d1d005337394d9c49116db7_big.jpg" alt="【直播QQ群511720801】2017软考信息系统项目管理师-考前冲刺重难点解析">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="【直播QQ群511720801】2017软考信息系统项目管理师-考前冲刺重难点解析">【直播QQ群511720801】2017软考信息系统项目管理师-考前冲刺重难点解析</a></h2>
                    <h4 class="c9">
                        <span>共5课时</span>
                        <span>·</span>
                        <span>314人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="2016年下半年网络工程师考试真题详解上午题视频课程">
                        <img src="https://s1.51cto.com/images/201702/e14373e722a9504816906108c2d09664c1561a_big.jpg" alt="2016年下半年网络工程师考试真题详解上午题视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="2016年下半年网络工程师考试真题详解上午题视频课程">2016年下半年网络工程师考试真题详解上午题视频课程</a></h2>
                    <h4 class="c9">
                        <span>共9课时</span>
                        <span>·</span>
                        <span>142人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="MongoDB Certificate Exam C100DBA考试视频课程">
                        <img src="https://s1.51cto.com/images/201701/858774c6207c27905343116702cd05c6d4aa49_big.JPG" alt="MongoDB Certificate Exam C100DBA考试视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="MongoDB Certificate Exam C100DBA考试视频课程">MongoDB Certificate Exam C100DBA考试视频课程</a></h2>
                    <h4 class="c9">
                        <span>共48课时</span>
                        <span>·</span>
                        <span>401人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="《H3C官方模拟器HCL（H3C Cloud Lab）从入门到精通》视频课程全球首发">
                        <img src="https://s1.51cto.com/wyfs02/M01/57/32/wKioL1SUGPLxtqybAADewUihLMM763_big.jpg" alt="《H3C官方模拟器HCL（H3C Cloud Lab）从入门到精通》视频课程全球首发">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="《H3C官方模拟器HCL（H3C Cloud Lab）从入门到精通》视频课程全球首发">《H3C官方模拟器HCL（H3C Cloud Lab）从入门到精通》视频课程全球首发</a></h2>
                    <h4 class="c9">
                        <span>共17课时</span>
                        <span>·</span>
                        <span>30333人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="HCIE v2.0考题出题官Hans华为安全HCNPv2.0/HCIEv1.5课程第六门">
                        <img src="https://s1.51cto.com/images/201612/c4a1e6c560c9224a3d01812aaf8e213bd7c07c_big.jpg" alt="HCIE v2.0考题出题官Hans华为安全HCNPv2.0/HCIEv1.5课程第六门">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="HCIE v2.0考题出题官Hans华为安全HCNPv2.0/HCIEv1.5课程第六门">HCIE v2.0考题出题官Hans华为安全HCNPv2.0/HCIEv1.5课程第六门</a></h2>
                    <h4 class="c9">
                        <span>共18课时</span>
                        <span>·</span>
                        <span>600人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="最新版RHCA7-RH436实战视频课程">
                        <img src="https://s1.51cto.com/images/201611/44dfdc0152c33755ed548821a21bd29cf04263_big.jpg" alt="最新版RHCA7-RH436实战视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="最新版RHCA7-RH436实战视频课程">最新版RHCA7-RH436实战视频课程</a></h2>
                    <h4 class="c9">
                        <span>共17课时</span>
                        <span>·</span>
                        <span>283人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="百度高级认证BCMM视频课程-研究方法与论文写作">
                        <img src="https://s1.51cto.com/images/201611/b61386e80b417ea2918514af2d8693d61cbf97_big.png" alt="百度高级认证BCMM视频课程-研究方法与论文写作">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="百度高级认证BCMM视频课程-研究方法与论文写作">百度高级认证BCMM视频课程-研究方法与论文写作</a></h2>
                    <h4 class="c9">
                        <span>共4课时</span>
                        <span>·</span>
                        <span>48人学习</span>
                    </h4>
                </div>
            </li>
                    </ul>
                <ul class="List ListCourse tablist" >
        	            <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Windows Server 2012 R2 Hyper-V 管理实战视频课程">
                        <img src="https://s1.51cto.com/images/201701/d9aa69a22fe6bfcde8292890e72a1576fe2f68_big.jpg" alt="Windows Server 2012 R2 Hyper-V 管理实战视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Windows Server 2012 R2 Hyper-V 管理实战视频课程">Windows Server 2012 R2 Hyper-V 管理实战视频课程</a></h2>
                    <h4 class="c9">
                        <span>共7课时</span>
                        <span>·</span>
                        <span>983人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Openstack从入门到放弃视频课程">
                        <img src="https://s1.51cto.com/images/201609/651212277ce4c2a828f005d7b943f091279e88_big.png" alt="Openstack从入门到放弃视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Openstack从入门到放弃视频课程">Openstack从入门到放弃视频课程</a></h2>
                    <h4 class="c9">
                        <span>共32课时</span>
                        <span>·</span>
                        <span>4867人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="【张彬Linux】Openstack实战部署、运维和管理实战视频课程">
                        <img src="https://s1.51cto.com/images/201609/88b5f3c197c4720aa2c024f57ccdeabb30f50f_big.jpg" alt="【张彬Linux】Openstack实战部署、运维和管理实战视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="【张彬Linux】Openstack实战部署、运维和管理实战视频课程">【张彬Linux】Openstack实战部署、运维和管理实战视频课程</a></h2>
                    <h4 class="c9">
                        <span>共5课时</span>
                        <span>·</span>
                        <span>962人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="使用Docker部署Nextcloud云盘服务视频课程">
                        <img src="https://s1.51cto.com/images/201611/3278ec27549e5d32d263483e7c191bd2ba8083_big.jpg" alt="使用Docker部署Nextcloud云盘服务视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="使用Docker部署Nextcloud云盘服务视频课程">使用Docker部署Nextcloud云盘服务视频课程</a></h2>
                    <h4 class="c9">
                        <span>共10课时</span>
                        <span>·</span>
                        <span>520人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="配置图形加速的View虚拟桌面-NVIDIA GRID K2使用指南">
                        <img src="https://s1.51cto.com/images/201612/e1511e250c8da83aabf666efef96b05ef63b96_big.jpg" alt="配置图形加速的View虚拟桌面-NVIDIA GRID K2使用指南">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="配置图形加速的View虚拟桌面-NVIDIA GRID K2使用指南">配置图形加速的View虚拟桌面-NVIDIA GRID K2使用指南</a></h2>
                    <h4 class="c9">
                        <span>共19课时</span>
                        <span>·</span>
                        <span>343人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="KVM虚拟化与Proxmox虚拟化平台视频课程">
                        <img src="https://s1.51cto.com/images/201612/17f2a9c8395ce09b075049a4aa0e023392ff4c_big.png" alt="KVM虚拟化与Proxmox虚拟化平台视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="KVM虚拟化与Proxmox虚拟化平台视频课程">KVM虚拟化与Proxmox虚拟化平台视频课程</a></h2>
                    <h4 class="c9">
                        <span>共10课时</span>
                        <span>·</span>
                        <span>259人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="KVM虚拟化进阶与提高视频课程">
                        <img src="https://s1.51cto.com/images/201612/444490a91076de9b55080644343ead73e5a57e_big.png" alt="KVM虚拟化进阶与提高视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="KVM虚拟化进阶与提高视频课程">KVM虚拟化进阶与提高视频课程</a></h2>
                    <h4 class="c9">
                        <span>共89课时</span>
                        <span>·</span>
                        <span>1923人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="权威Docker指南视频【丁丁历险】">
                        <img src="https://s1.51cto.com/images/201701/e22824d9623382806c27121962e1e653c8d89e_big.jpg" alt="权威Docker指南视频【丁丁历险】">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="权威Docker指南视频【丁丁历险】">权威Docker指南视频【丁丁历险】</a></h2>
                    <h4 class="c9">
                        <span>共15课时</span>
                        <span>·</span>
                        <span>324人学习</span>
                    </h4>
                </div>
            </li>
                    </ul>
                <ul class="List ListCourse tablist" >
        	            <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="JAVA-ACE-架构师系列视频课程- RocketMQ（上）">
                        <img src="https://s1.51cto.com/images/201612/27b4b3b943ec1290c117917c181d6d4229a7b7_big.jpg" alt="JAVA-ACE-架构师系列视频课程- RocketMQ（上）">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="JAVA-ACE-架构师系列视频课程- RocketMQ（上）">JAVA-ACE-架构师系列视频课程- RocketMQ（上）</a></h2>
                    <h4 class="c9">
                        <span>共20课时</span>
                        <span>·</span>
                        <span>8673人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="跟老谭学FreeMarker视频课程">
                        <img src="https://s1.51cto.com/images/201611/3408979257cc3e025df72741ffb96dd46983fe_big.jpg" alt="跟老谭学FreeMarker视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="跟老谭学FreeMarker视频课程">跟老谭学FreeMarker视频课程</a></h2>
                    <h4 class="c9">
                        <span>共31课时</span>
                        <span>·</span>
                        <span>3553人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="SpringMvc JDBC jQWidgets项目案例JasperReport自动化报表系统视频课程">
                        <img src="https://s1.51cto.com/images/201612/c90d80310fd8fa6091664721f36cbf1f3e6dc2_big.jpg" alt="SpringMvc JDBC jQWidgets项目案例JasperReport自动化报表系统视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="SpringMvc JDBC jQWidgets项目案例JasperReport自动化报表系统视频课程">SpringMvc JDBC jQWidgets项目案例JasperReport自动化报表系统视频课程</a></h2>
                    <h4 class="c9">
                        <span>共21课时</span>
                        <span>·</span>
                        <span>1915人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Lucene教学视频从入门到精通（备Java基础，JavaSE，JavaEE）">
                        <img src="https://s1.51cto.com/images/201612/d89a8c018133dc3b6ff37060cf20b78124dbb8_big.jpg" alt="Lucene教学视频从入门到精通（备Java基础，JavaSE，JavaEE）">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Lucene教学视频从入门到精通（备Java基础，JavaSE，JavaEE）">Lucene教学视频从入门到精通（备Java基础，JavaSE，JavaEE）</a></h2>
                    <h4 class="c9">
                        <span>共18课时</span>
                        <span>·</span>
                        <span>318人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="ASP.NET企业开发独立案例视频课程">
                        <img src="https://s1.51cto.com/images/201612/e9a5ad843bfe4aa6848428016948436f4a3b37_big.jpg" alt="ASP.NET企业开发独立案例视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="ASP.NET企业开发独立案例视频课程">ASP.NET企业开发独立案例视频课程</a></h2>
                    <h4 class="c9">
                        <span>共27课时</span>
                        <span>·</span>
                        <span>527人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Maven配置与使用视频课程">
                        <img src="https://s1.51cto.com/images/201612/999a947524afff3e56400171b1c45f9f58cd40_big.jpg" alt="Maven配置与使用视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Maven配置与使用视频课程">Maven配置与使用视频课程</a></h2>
                    <h4 class="c9">
                        <span>共13课时</span>
                        <span>·</span>
                        <span>388人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="零基础学会在Linux上编译调试C++项目视频课程">
                        <img src="https://s1.51cto.com/images/201701/699a96c6825e14d0199454e7e41289cc6e37ff_big.png" alt="零基础学会在Linux上编译调试C++项目视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="零基础学会在Linux上编译调试C++项目视频课程">零基础学会在Linux上编译调试C++项目视频课程</a></h2>
                    <h4 class="c9">
                        <span>共31课时</span>
                        <span>·</span>
                        <span>343人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Weblogic Server 11g实战系列课程之一：Weblogic基础">
                        <img src="https://s1.51cto.com/images/201701/99a7a8a72ea238cfde9639764440075cd58860_big.jpg" alt="Weblogic Server 11g实战系列课程之一：Weblogic基础">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Weblogic Server 11g实战系列课程之一：Weblogic基础">Weblogic Server 11g实战系列课程之一：Weblogic基础</a></h2>
                    <h4 class="c9">
                        <span>共31课时</span>
                        <span>·</span>
                        <span>342人学习</span>
                    </h4>
                </div>
            </li>
                    </ul>
                <ul class="List ListCourse tablist" >
        	            <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="高级性能测试工程师-Nginx性能调优视频课程">
                        <img src="https://s1.51cto.com/images/201606/e8a6c5774953c07197559398258d400fea826e_big.jpg" alt="高级性能测试工程师-Nginx性能调优视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="高级性能测试工程师-Nginx性能调优视频课程">高级性能测试工程师-Nginx性能调优视频课程</a></h2>
                    <h4 class="c9">
                        <span>共9课时</span>
                        <span>·</span>
                        <span>1448人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Spring Cloud微服务实战【持续连载】">
                        <img src="https://s1.51cto.com/images/201610/98701cb564d4d77d5ee801cb1bb4800ec8d2d4_big.jpg" alt="Spring Cloud微服务实战【持续连载】">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Spring Cloud微服务实战【持续连载】">Spring Cloud微服务实战【持续连载】</a></h2>
                    <h4 class="c9">
                        <span>共42课时</span>
                        <span>·</span>
                        <span>32990人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="精通Power Designer 16.5建模系列视频课程——精华版">
                        <img src="https://s1.51cto.com/images/201610/c2300ae54b8b4190da55484539d70e37f7fc2a_big.jpg" alt="精通Power Designer 16.5建模系列视频课程——精华版">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="精通Power Designer 16.5建模系列视频课程——精华版">精通Power Designer 16.5建模系列视频课程——精华版</a></h2>
                    <h4 class="c9">
                        <span>共21课时</span>
                        <span>·</span>
                        <span>3154人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="敏捷风暴视频课程—实战敏捷需求分析">
                        <img src="https://s1.51cto.com/images/201608/11aa15683cf8749017b232b0d5403eefce2da5_big.jpg" alt="敏捷风暴视频课程—实战敏捷需求分析">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="敏捷风暴视频课程—实战敏捷需求分析">敏捷风暴视频课程—实战敏捷需求分析</a></h2>
                    <h4 class="c9">
                        <span>共23课时</span>
                        <span>·</span>
                        <span>334人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="1+1系列Java实训教程--大学生JavaEE企业级前台敏捷开发视频课程">
                        <img src="https://s1.51cto.com/images/201701/569415711793d1438ef727fbad4a9d701b6c49_big.jpg" alt="1+1系列Java实训教程--大学生JavaEE企业级前台敏捷开发视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="1+1系列Java实训教程--大学生JavaEE企业级前台敏捷开发视频课程">1+1系列Java实训教程--大学生JavaEE企业级前台敏捷开发视频课程</a></h2>
                    <h4 class="c9">
                        <span>共16课时</span>
                        <span>·</span>
                        <span>7145人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="OpenGL 实现Google地图瓦片的绘制,漫游">
                        <img src="https://s1.51cto.com/images/201611/065a7a157772bf3bbc8138d7cf58252f859894_big.png" alt="OpenGL 实现Google地图瓦片的绘制,漫游">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="OpenGL 实现Google地图瓦片的绘制,漫游">OpenGL 实现Google地图瓦片的绘制,漫游</a></h2>
                    <h4 class="c9">
                        <span>共30课时</span>
                        <span>·</span>
                        <span>1219人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="【2016版】测试必备系统知识(Linux|Oracle)视频课程">
                        <img src="https://s1.51cto.com/images/201611/0214ed989e95189b2bd4449335ddb0eb0870f9_big.jpg" alt="【2016版】测试必备系统知识(Linux|Oracle)视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="【2016版】测试必备系统知识(Linux|Oracle)视频课程">【2016版】测试必备系统知识(Linux|Oracle)视频课程</a></h2>
                    <h4 class="c9">
                        <span>共42课时</span>
                        <span>·</span>
                        <span>933人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Makefile工程实践(第2季)：使用Autotools自动生成Makefile">
                        <img src="https://s1.51cto.com/images/201702/25181633078641ddef5935c7b0543f91b394ce_big.jpg" alt="Makefile工程实践(第2季)：使用Autotools自动生成Makefile">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Makefile工程实践(第2季)：使用Autotools自动生成Makefile">Makefile工程实践(第2季)：使用Autotools自动生成Makefile</a></h2>
                    <h4 class="c9">
                        <span>共10课时</span>
                        <span>·</span>
                        <span>90人学习</span>
                    </h4>
                </div>
            </li>
                    </ul>
                <ul class="List ListCourse tablist" >
        	            <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Visio应用（主题和样式+形状数据+流程图）视频教程(上)">
                        <img src="https://s1.51cto.com/images/201612/75f6c705345dfd75e8f3657451de6a4231c397_big.png" alt="Visio应用（主题和样式+形状数据+流程图）视频教程(上)">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Visio应用（主题和样式+形状数据+流程图）视频教程(上)">Visio应用（主题和样式+形状数据+流程图）视频教程(上)</a></h2>
                    <h4 class="c9">
                        <span>共61课时</span>
                        <span>·</span>
                        <span>2791人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Onenote2016笔记软件使用视频课程">
                        <img src="https://s1.51cto.com/images/201612/1157768996df94d6bdf882c4692c6e24ca9526_big.jpg" alt="Onenote2016笔记软件使用视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Onenote2016笔记软件使用视频课程">Onenote2016笔记软件使用视频课程</a></h2>
                    <h4 class="c9">
                        <span>共17课时</span>
                        <span>·</span>
                        <span>1034人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Excel VBA高手之路系列视频课程之进阶篇">
                        <img src="https://s1.51cto.com/images/201701/72725de116884178f01441b79443584c998929_big.jpg" alt="Excel VBA高手之路系列视频课程之进阶篇">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Excel VBA高手之路系列视频课程之进阶篇">Excel VBA高手之路系列视频课程之进阶篇</a></h2>
                    <h4 class="c9">
                        <span>共29课时</span>
                        <span>·</span>
                        <span>473人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Excel 2016  函数公式必修视频课程【时间、逻辑、数学函数】">
                        <img src="https://s1.51cto.com/images/201702/09fdbb550f23d792c8d6377dee753be8258f44_big.jpg" alt="Excel 2016  函数公式必修视频课程【时间、逻辑、数学函数】">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>首发</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Excel 2016  函数公式必修视频课程【时间、逻辑、数学函数】">Excel 2016  函数公式必修视频课程【时间、逻辑、数学函数】</a></h2>
                    <h4 class="c9">
                        <span>共52课时</span>
                        <span>·</span>
                        <span>32人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="Excel VBA 基础及编程领域经典难点问题- Excel VBA 代码实现视频课程">
                        <img src="https://s1.51cto.com/images/201702/519a5aa645d144070348368ad635d9b1701230_big.jpg" alt="Excel VBA 基础及编程领域经典难点问题- Excel VBA 代码实现视频课程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="Excel VBA 基础及编程领域经典难点问题- Excel VBA 代码实现视频课程">Excel VBA 基础及编程领域经典难点问题- Excel VBA 代码实现视频课程</a></h2>
                    <h4 class="c9">
                        <span>共15课时</span>
                        <span>·</span>
                        <span>1232人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="【王佩丰】PowerPoint2010视频教程">
                        <img src="https://s1.51cto.com/images/201607/55b0a9336bb451717ef6407124330c904aa6fc_big.jpg" alt="【王佩丰】PowerPoint2010视频教程">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="【王佩丰】PowerPoint2010视频教程">【王佩丰】PowerPoint2010视频教程</a></h2>
                    <h4 class="c9">
                        <span>共20课时</span>
                        <span>·</span>
                        <span>390571人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank" class="picDiv" title="【曾贤志】Excel从零到精通视频课程第2季（函数篇）">
                        <img src="https://s1.51cto.com/images/201611/b70629212426509416520925d737810471dc0d_big.png" alt="【曾贤志】Excel从零到精通视频课程第2季（函数篇）">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                    <p>独家</p>                </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean4.sectionid}&courseid=${courseBean4.course_id}" target="_blank"  title="【曾贤志】Excel从零到精通视频课程第2季（函数篇）">【曾贤志】Excel从零到精通视频课程第2季（函数篇）</a></h2>
                    <h4 class="c9">
                        <span>共24课时</span>
                        <span>·</span>
                        <span>900人学习</span>
                    </h4>
                </div>
            </li>
                        <li>
                <!-- 小角标-录播 -->
                                <div class="pic">
                    <a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank" class="picDiv" title="高大上的PPT设计秘笈（正式版）-不限等级">
                        <img src="https://s1.51cto.com/images/201609/825a4557475d86521bb768b8250bc4a754b347_big.jpg" alt="高大上的PPT设计秘笈（正式版）-不限等级">
                        <img src="https://static1.51cto.com/edu/index/images/img_mask.png" class="picMask">
                    </a>
                                    </div>
                <div class="info">
                    <h2><a href="<%=basePath %>courselistservlet?order=datainfo&sectionid=${courseBean5.sectionid}&courseid=${courseBean5.course_id}" target="_blank"  title="高大上的PPT设计秘笈（正式版）-不限等级">高大上的PPT设计秘笈（正式版）-不限等级</a></h2>
                    <h4 class="c9">
                        <span>共45课时</span>
                        <span>·</span>
                        <span>3049人学习</span>
                    </h4>
                </div>
            </li>
                    </ul>
            </div>
</div>
<!-- 讲师机构 -->
<div class="Lists">
    <div class="Page">
        <div class="Til tc">
            <p>一线实战讲师</p>
        </div>
        <ul class="lecturersList"> 
        	<li>
                <a class="pics" target="_blank" href="http://edu.51cto.com/index.php?do=search&m=course&q=%E8%B5%96%E5%9B%BD%E8%8D%A3" title="赖国荣">
                    <img src="<%=basePath %>image/lgr.jpg">
                    <img src="https://static1.51cto.com/edu/index/images/lec_mask.png">
                </a>
                <h2 class="oneLine">
                    <a href="http://edu.51cto.com/index.php?do=search&m=course&q=%E8%B5%96%E5%9B%BD%E8%8D%A3" target="_blank" title="赖国荣">赖国荣</a>
                </h2>
                <h3 class="oneLine">金牌讲师</h3>
                <p class="oneLine">编程19年，10年软件开发，</p>
                <p>主讲java系列课程</p>
                <p>设计开发40多个大型项目</p>
            </li> 
        	<li>
                 <a class="pics" target="_blank" >
                   <img src="<%=basePath %>images/1.JPG">
                   <img src="https://static1.51cto.com/edu/index/images/lec_mask.png">
                  </a>
                <h2 class="oneLine">
                   陈飞龙
                </h2>
                <h3 class="oneLine">特级讲师</h3>
                <p class="oneLine">Hadoop/JAVA/JSP</p>
            </li>
            <li>
                 <a class="pics" target="_blank" >
                   <img src="<%=basePath %>images/1.JPG">
                   <img src="https://static1.51cto.com/edu/index/images/lec_mask.png">
                  </a>
                <h2 class="oneLine">
                   陈飞龙
                </h2>
                <h3 class="oneLine">特级讲师</h3>
                <p class="oneLine">Hadoop/JAVA/JSP</p>
            </li>
           <li>
                 <a class="pics" target="_blank" >
                   <img src="<%=basePath %>images/1.JPG">
                   <img src="https://static1.51cto.com/edu/index/images/lec_mask.png">
                  </a>
                <h2 class="oneLine">
                   陈飞龙
                </h2>
                <h3 class="oneLine">特级讲师</h3>
                <p class="oneLine">Hadoop/JAVA/JSP</p>
            </li>
            <li>
                 <a class="pics" target="_blank" >
                   <img src="<%=basePath %>images/1.JPG">
                   <img src="https://static1.51cto.com/edu/index/images/lec_mask.png">
                  </a>
                <h2 class="oneLine">
                   陈飞龙
                </h2>
                <h3 class="oneLine">特级讲师</h3>
                <p class="oneLine">Hadoop/JAVA/JSP</p>
            </li>
        </ul>
</div>
<!-- APP -->
<div class="APPs">
    <div class="Page">
        <h2>下载学院APP 缓存视频 随时学习</h2>
        <h3>学IT一个APP就够了</h3>
        <div classMain></div>
        <img src="<%=basePath %>image/apps.png" class="fl">
        <div class="btns fl">
            <a target="_blank" href="<%=basePath %>courselistservlet?order=app" class="android"  class="btn">Android</a>
            <a target="_blank" href="<%=basePath %>courselistservlet?order=app" class="apple" class="btn">iPhone</a>
            <a target="_blank" href="<%=basePath %>courselistservlet?order=app" class="apple" class="btn">iPad</a>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!-- 友情链接 -->
<div class="Links">
    <div class="Page">
        <p class="fl f18 c6">友情链接</p>
        <ul class="fl">
			<li><a href="<%=basePath %>datainfo/shouye.jsp" target='_blank'>本站主站点</a></li>
        	<li><a href="http://wot.51cto.com/?edulinks " target='_blank'>WOT峰会</a></li>
        	<li><a href="http://wot.51cto.com/act/bcsl/info?edulinks" target='_blank'>百城沙龙</a></li>
        	<li><a href="http://www.tedu.cn/" target='_blank'>达内教育</a></li>
        	<li><a href="http://www.examw.com/jzs1" target='_blank'>中华考试网</a></li>
        	<li><a href="http://www.kaoshidian.com/ " target='_blank'>考试点考研网</a></li>
        	<li><a href="http://bbs.hh010.com/" target='_blank'>鸿鹄论坛</a></li>
        	<li><a href="http://www.kf5.com/" target='_blank'>逸创云客服</a></li>
        	<li><a href="http://www.2018.cn/" target='_blank'>2018招生网</a></li>
        	<li><a href="http://www.genshuixue.com/bj/ " target='_blank'>跟谁学</a></li>
        	<li><a href="http://www.thinkphp.cn" target='_blank'>ThinkPHP框架</a></li>
        	<li><a href="http://www.jcwcn.com/" target='_blank'>教程网</a></li>
        	<li><a href="http://www.apkbus.com/" target='_blank'>安卓巴士</a></li>
        	<li><a href="http://win10.ithome.com/ " target='_blank'>Win10之家</a></li>
        	<li><a href="http://www.php100.com/" target='_blank'>PHP100</a></li>
        	<li><a href="http://www.code4app.com" target='_blank'>code4app</a></li>
        	<li><a href="http://www.xker.com" target='_blank'>新客网</a></li>
        	<li><a href="http://www.phpchina.com" target='_blank'>PHPChina</a></li>
        	<li><a href="http://www.w3cschool.cn/" target='_blank'>W3Cschool</a></li>
        	<li><a href="http://www.atool.org/" target='_blank'>在线工具</a></li>
        	<li><a href=" http://www.zuidaima.com/" target='_blank'>java源代码学习</a></li>
        	<li><a href="http://www.yiibai.com/" target='_blank'>易百教程</a></li>
        	<li><a href="http://www.officezhushou.com/" target='_blank'>Office教程</a></li>
        	<li><a href="http://www.html5cn.com.cn" target='_blank'>html5</a></li>
        	<li><a href="http://www.thinksaas.cn" target='_blank'>开源社区</a></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div class="Footer">
    <div class="Page">
        <div class="clear"></div>
        <div class="Logo fl">
            <img src="<%=basePath %>image/itlogo.png">
            <table>
                <tr>
                    <td>
                        <img src="<%=basePath %>images/it.bmp" style="height:150px;width:150px">
                        <p>学院APP</p>
                    </td>
                    <td>
                        <img src="<%=basePath %>images/it.bmp"  style="height:150px;width:150px">
                        <p>官方微信</p>
                    </td>
                </tr>
            </table>
        </div>
        <div class="info fl">
            <div class="links">
                <a href="<%=basePath %>courselistservlet?order=guanyu" target="_blank">关于我们</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=help" target="_blank">帮助中心</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=fankui1" target="_blank">意见反馈</a>
                <span>|</span>
                <a href="<%=basePath %>courselistservlet?order=lianxi" target="_blank"  title="联系我们">联系我们</a>
                <span>|</span>
                <a href="javascript:void(0);" target="_blank">课程登记</a>
                <span>|</span>
                <a href="javascript:void(0);" target="_blank">学员故事</a>
                <span>|</span>
                <a href="javascript:void(0);" target="_blank"  title="学员交流">学员交流</a>
            </div>
            <p class="call"><span>176-0797-5702</span> 09:00-19:00</p>
            <p class="copy">Copyright &copy; 2017-2027 <a href="<%=basePath %>courselistservlet?order=list" target="_blank">IT课堂</a></p>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="mask disp-n" id="AdviceMask"></div>
<div class="Advice disp-n" id="Advice">
    <div class="Main">
        <button class="close" onclick="$('#AdviceMask').hide();$('#Advice').hide();">&nbsp;</button>
        <h3>可以开发票么？</h3>
        <p>可以的，购买课程或者充值余额后都是可以开具发票的，具体详情点击：<a href="http://bbs.51cto.com/thread-1472105-1.html" target="_blank">我要开发票</a></p>
        <h3>购买的课程可以下载么？</h3>
        <p>目前PC端暂不支持下载课程视频，请手机或者平板电脑下载“51CTO学院”APP后再下载视频哦！</p>
        <h3>优惠券如何使用？</h3>
        <p>非折扣课程（不包含1元课程/套餐）可使用，一个订单（可包含多个课程）只可使用一张；优惠券一经使用，不再返还；若被冻结请在PC端删除订单即可返还。</p>
        <p class="mt20">更多问题查询点击 <a href="http://edu.51cto.com/help.html" target="_blank">帮助中心</a></p>
        <p class="mt10">欢迎您提供宝贵意见，对于您的意见我们都会认真、慎重的讨论，每一个意见都是我们更好为您服务的鞭策和激励，感谢您帮助学院成长，<a href="http://edu.51cto.com/user/feedback.html" target="_blank">我要反馈意见</a></p>
        <button id="bizQQ_WPA">&nbsp;</button>
    </div>
</div>


<script type="text/javascript">
var imgteacher = '{IMGPATH}';
var searchType = [
    'http://edu.51cto.com/index.php?do=search&m=course&',
    'http://edu.51cto.com/px/train/search?',
    'http://edu.51cto.com/index.php?do=search&m=lecturer&',
    'http://edu.51cto.com/t/exam/search?'
]
$('#bizQQ_WPA').click(function(){
    window.open('http://edu.51cto.com/contactqq.html')
})
</script>
<script type="text/javascript" src="https://static1.51cto.com/edu/index/js/index_new.js?v=3.2.11"></script>

<script type="text/javascript" src="https://static1.51cto.com/edu/js/md5.js"></script>
<script type="text/javascript" src="https://static1.51cto.com/edu/js/tract_public.js?v=10.21"></script>
<script type="text/javascript">
	vv_log.isCookie('cookiename');
</script>
<script src="https://logs.51cto.com/rizhi/count/count.js"></script>
<!-- ptmind 统计 start-->
<script type="text/javascript">
  window._pt_lt = new Date().getTime();
  window._pt_sp_2 = [];
  _pt_sp_2.push('setAccount,3f67dcc4');
  var _protocol = (("https:" == document.location.protocol) ? " https://" : " http://");
  
  (function() {
	var atag = document.createElement('script'); atag.type = 'text/javascript'; atag.async = true;
	atag.src = _protocol + 'js.ptengine.cn/js/pta.js';
	var stag = document.createElement('script'); stag.type = 'text/javascript'; stag.async = true;
	stag.src = _protocol + 'js.ptengine.cn/js/pts.js';
	var s = document.getElementsByTagName('script')[0]; 
	s.parentNode.insertBefore(atag, s);s.parentNode.insertBefore(stag, s);
  })();
</script>
<!-- ptmind 统计 end-->
<!-- 大数据统计 -->
<script typ="text/javascript">
    var log_url = 'http://da.51cto.com';
    var sendlog_url = 'http://edu.51cto.com/px/log/sends';//注意跨域
    var course_id = 0; //课程ID
    var levelid = 0; //课程难度
    var packid = 0; //套餐ID
    var source = 0; //录播,wap,客户端
    var user_id = 0;
    var lec_id = 0;
    var sessionid = '';
    var ip = '';
</script>
<script src="https://static1.51cto.com/edu/index/js/../../js/md5.js"></script>
<script src="https://static1.51cto.com/edu/index/js/../../pxb/js/log_public.js"></script>
<script type="text/javascript">
    var rmid = 0;//首页
    function addScript(){
        var JSONP = document.createElement("script");
        JSONP.type = "text/javascript";
        JSONP.src = 'https://static1.51cto.com/edu/index/js/../../pxb/js/pxb_pv_tract.js?v=1.1';
        document.getElementsByTagName("head")[0].appendChild(JSONP);
    }
    $.getJSON(web_url+'index/like',function(data){
        user_id = data.user_id;
        sessionid = data.session_id;
        ip = data.ip;
        addScript();
    });
</script>
<!-- 大数据统计 -->
<script type="text/javascript"> document.write(unescape("%3Cscript src='https://tongji.51cto.com/cto.js/b57176900a4805e17afc7b8e25a43abf' type='text/javascript'%3E%3C/script%3E")); </script>

<script>
//百度统计
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?8c8abdb71d78d33dfdb885e0bc71dae0";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<div style="display:none">
<iframe frameborder="0" scrolling="no" width="0" height="0" src="http://log.51cto.com/pageview.php?frompos=edu_art"></iframe>
</div>    
</body>
</html>
