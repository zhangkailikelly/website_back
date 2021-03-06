<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head lang="en">
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta charset="UTF-8">
    <meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="Expires" content="0" />
	<link href="../html/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="../html/css/style.css"/>
	<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
	<script src="../html/js/bootstrap.min.js"></script>
	<script src="../html/js/react.js"></script>
	<script src="../html/js/react-dom.js"></script>
	<script src="../html/js/browser.min.js"></script>
	<script src="../html/js/main.js"></script>
	<script src="../html/js/url.js"></script>
</head>

<script type="text/javascript">
    function onkeyseach(event){
        if(event.keyCode==13)
	    {
	        document.getElementById("btn_submit").click();
	        return false;
	    }
    }
</script>

<body class="supplier" onkeydown="onkeyseach(event)">

    <div class="content" style="width: 1200px; margin: 0 auto;">
    	<div class="mid_bg">
		<script src="js/bootstrap.min.js"></script>
		<script src="js/dateUtil.js"></script>
		<script type="text/javascript">
			var jfutype=isNull(sessionStorage.getItem("jfutype"))?localStorage.getItem("jfutype"):sessionStorage.getItem("jfutype");
			/*jfutype 用户类型 1 发包方 2接包方*/
			var jfustate=isNull(sessionStorage.getItem("jfustate"))?localStorage.getItem("jfustate"):sessionStorage.getItem("jfustate");
			/*jfustate 用户审核的状态  用户状态 0-初始状态 1-填写资料-提交 4-已审核 3-驳回*/
			//立即竞拍 按钮
			//console.log(123456);
			function gotoDetail(demandid){
			   if(4==jfustate){
			   		var formid="detailForm_";
					var detailform=document.getElementById(formid+demandid);
				  	var category3=detailform.category3.value;
				  	var category1=detailform.category1.value;
				  	var twolevindustry=detailform.twolevindustry.value;
				  	var threelevindustry=detailform.threelevindustry.value;
					//detailform.action="customer_lj_DemandDetail";
					//detailform.method="post";
					//detailform.submit();
					if("销售线索挖掘"==category3.trim()){
						if("其他"==twolevindustry.trim()&&"教育培训"==category1.trim()){
							window.location.href="../html/customer_Auction.html#"+demandid;
						}else if("线上"==twolevindustry.trim()&&"教育培训"==category1.trim()){
							window.location.href="../html/customer_Auction_new.html#"+demandid;
						}else if("线下"==twolevindustry.trim()&&"教育培训"==category1.trim()){
							window.location.href="../html/customer_Auction_new.html#"+demandid;
						}else{
							window.location.href="../html/customer_Auction.html#"+demandid;
						}
					}else{
						window.location.href="../html/data_Auction.html#"+demandid;
					}
			   }else{
			   		$(".cover").show();
			   }
			}

			function toTZ(){
				var toPaggeVlue = document.getElementById("toGoPage").value;
				var tolPageValue = document.getElementById("tolPageValue").value;
				if(toPaggeVlue == ''){
					document.getElementById("toGoPage").value=1;return;
				}
				if(isNaN(Number(toPaggeVlue))){
					document.getElementById("toGoPage").value=1;return;
				}
				if(Number(toPaggeVlue)>Number(tolPageValue)){
					document.getElementById("toGoPage").value=tolPageValue;return;
				}
				nextPage(toPaggeVlue);
			}
			function nextPage(page){
			   document.getElementById("currentPage").value=page;
			   getDemandHall("page");
			}
			function seachDemandHall(){
			    //清空条件 ul li.selected
		        $("#box1 li").eq(0).addClass("selected").siblings().removeClass("selected");
		        $("#box2 li").eq(0).addClass("selected").siblings().removeClass("selected");
		        $("#box3 li").eq(0).addClass("selected").siblings().removeClass("selected");
		        $("#box4 li").eq(0).addClass("selected").siblings().removeClass("selected");
		        $("#box5 li").eq(0).addClass("selected").siblings().removeClass("selected");
		        $("#box6 li").eq(0).addClass("selected").siblings().removeClass("selected");
		        document.getElementById("currentPage").value="1";
				getDemandHall("");
			}


			//取得需求列表
		  	function getDemandHall(page){
					  	//非分页过来的  默认到第一页
					  	if("page"!=page){
					  	  document.getElementById("currentPage").value="1";
					  	}
		  	            var orderBy=$(".deman_hall_search .search_box ul li.selected").attr("data");
		  	            var sort="";
		  	            var sorttext=$(".deman_hall_search .search_box ul li.selected").find(".sequence").text();
		  	            if("↑"==sorttext){//desc降序 asc 升序
		  	               sort="asc";
		    			}else if("↓"==sorttext){
		    			   sort="desc";
		    			}
		  		     var data={
			            "category1":$(".deman_hall_box ul li.selected").eq(0).attr("data"),//面向行业
			            "category3":$(".deman_hall_box ul li.selected").eq(1).attr("data"),//业务类型
			            "targecity":$(".deman_hall_box ul li.selected").eq(2).attr("data"),//目标城市
			            //"category2":$(".deman_hall_box ul li.selected").eq(3).attr("data"),//获客渠道
			            "auction":$(".deman_hall_box ul li.selected").eq(3).attr("data"),//可竞拍不可竞拍
			            "pricerange":$(".deman_hall_box ul li.selected").eq(4).attr("data"),//需求单价
			            "keyword":document.getElementById("ordername").value,
			            "demandid":document.getElementById("demandid").value,
			            "orderBy":orderBy,
			            "sort":sort,
			            "currentPage":document.getElementById("currentPage").value
			         };
					$.post('getDemandHall',data,function(r){
						if(r.code=="Y"){
							    if(undefined==r.results.length || r.results.length==0){
				 					$("#search_reslut").addClass("no-reslut");
									$("#search_reslut").html("暂无数据");
								}else{
									$("#search_reslut").removeClass("no-reslut");
									$("#search_reslut").html("");
								    $.each(r.results,function(index,d)
									{
										    var str='';
											//业务类型1-销售线索挖掘  -A  2数据加工  3-人工客服 （4-运营商增值服务  5-到场体验 6-电商代理）
											var category3=d.category3;//意向挖掘
											var category1=d.category1;//成人	教育
											var demandid=d.demandid;//需求编号
											var orderprice=d.orderprice;//需求单价
											var jbfprice=d.jbfprice;//接包方需求单价
											var fishnum=d.fishnum;
											var fdstate=d.fdstate;//zi需求状态
											var ordername=d.ordername;//订单名
											var targecity=d.targecity;//北京
                                            var twolevindustry=d.twolevindustry;//二级行业
                                            var threelevindustry=d.threelevindustry;//三级行业

											var jp = 'jp' + index;
											var div = 'div' + index;

											var zq="";
											var begintime="";
											var endtime="";
											var demandtype=d.demandtype;// 1-套餐    2-个性化需求

											if('1'==demandtype){
											   begintime=d.begintime;//2016-08-25~2016-08-31
											   if(''==begintime||null==begintime){
												   
											   }else{
											  	 begintime=begintime.substring(0,10);
											  	 endtime=d.endtime;
											  	 if(!isNaN(endtime)){
											  	  //alert("是数字");
											  	  	var val = Date.parse(begintime);
												 	var newDate = new Date(val);
				    							 	var time2 = newDate.format("yyyy-MM-dd");
				    							 	endtime=addDate(time2,parseInt(endtime));
				    							 	endtime = endtime.format("yyyy-MM-dd");
											  	 }else{
											  	    endtime = new Date(endtime);
											  	    endtime = endtime.format("yyyy-MM-dd");
											  	 }
											   }
											}

											if('2'==demandtype){
											   begintime=d.begintime;
											   if(''==begintime||null==begintime){
											   	 begintime="";
											   }else{
											  	 begintime=begintime.substring(0,10);
											   }
											   endtime=d.endtime;
											   if(''==endtime||null==endtime){
											   	 endtime="";
											   }else{
											  	 endtime=endtime.substring(0,10);
											   }
											   endtime = new Date(endtime);
											   endtime = endtime.format("yyyy-MM-dd");
											}



											//如果结束日期在5天之内，则标红显示（同时竞拍按钮也用红色的，并且按钮内的字变为“马上抢拍”）；
											var now=new Date();
											now = now.format("yyyy-MM-dd");
											var intDay=subDate(now,endtime);

											zq=begintime+"~"+endtime;//项目周期  套餐要计算
											var category2=d.category2;//获客渠道 -电话营销
											if(null==category2){
												category2="";
											}
											var demanddescription=d.demanddescription;//需求描述
											if(null==demanddescription){
											    demanddescription="";
											}


											var favorableway=d.favorableway;//0-无优惠 1-免手续费
											var newdemand=d.newdemand;//0-老单   1-新单
											var releasenum=d.releasenum;

											var applicationnum=d.applicationnum;
											var syl=releasenum-applicationnum;
											var prent=(syl/releasenum)*100;
											var prent2=prent.toFixed(2);
                                                     

											str='<div class="reslut_box" id="'+div+'">';

											str+='<form name="detailForm_'+demandid+'" id="detailForm_'+demandid+'" action="">';
					    					str+='<input type="hidden" value="'+demandid+'" name="demandid">';
					    					str+='<input type="hidden" value="'+category3+'" name="category3">';
					    					str+='<input type="hidden" value="'+category1+'" name="category1">';
					    					str+='<input type="hidden" value="'+twolevindustry+'" name="twolevindustry">';
					    					str+='<input type="hidden" value="'+threelevindustry+'" name="threelevindustry">';
					    					str+='<input type="hidden" value="supplier_lj_demandHall2" name="ztDetail">';
					    					str+='</form>';

											str+='<div class="title">';
											str+='<h3 title="'+ordername+'">'+ordername+'</h3>';
											str+='<ul>';
											
											if(''==category3||null==category3){
											str+='<li class="bg_blue" style="display:none">'+category3+'</li>';
											}else{
											str+='<li class="bg_blue">'+category3+'</li>';
											}
											
											if(''==twolevindustry||null==twolevindustry){
												str+='<li class="bg_green" style="display:none">'+twolevindustry+'</li>';
												}else{
												str+='<li class="bg_green">'+twolevindustry+'</li>';
											}
											
//											if(''==threelevindustry||null==threelevindustry){
//												str+='<li class="bg_blue" style="display:none">'+threelevindustry+'</li>';
//												}else{
//												str+='<li class="bg_blue">'+threelevindustry+'</li>';
//											}
											
											if(''==category1||null==category1){
											str+='<li class="bg_rose" style="display:none">'+category1+'</li>';
											}else{
											str+='<li class="bg_rose">'+category1+'</li>';
											}
											
											if(''==targecity||null==targecity){
											str+='<li class="bd_blue" style="display:none">'+targecity+'</li>';
											}else{
											str+='<li class="bd_blue" title="'+targecity+'">'+targecity+'</li>';
											}
											
											str+='<li class="number">需求编号:'+demandid+'</li>';
											str+='</ul>';
											if(5>=intDay&&intDay>=0){
											str+='<p style="color: red">项目周期:'+zq+'</p>';
											}else if(intDay<0){
											str+='<p style="color: red">项目周期:'+zq+'</p>';
											}else{
											str+='<p>项目周期:'+zq+'</p>';
											}
											str+='</div>';
											str+='<div class="channel" style="display:none">获客渠道： <span>'+category2+'</span></div>';
											str+='<div class="description">';
											str+='<h4>需求描述： </h4>';
											str+='<p>'+demanddescription+'</p>';
											str+='</div>';
											str+='<div class="progress_bar">';
											str+='<div class="box">';
											str+='<div class="progress-box"><div class="rate" style="width: '+prent2+'%;"></div></div>';
											str+='<p>需求量<span class="orange">&nbsp;&nbsp;'+syl+'</span><span class="gray">/'+releasenum+'</span></p>';
											str+='</div>';

											if(4==jfustate){//orderprice
											str+='<div class="demand">需求单价<span>'+jbfprice+'</span>元</div>';
											}else{
											str+='<div class="demand">&nbsp;</div>';
											}
											str+='<ul>';
											if('1'==favorableway){
											str+='<li class="icon-free"><p>免竞拍手续费</p></li>';
											}
											if('1'==newdemand){
											str+='<li class="icon-new"><p>新上架需求</p></li>';
											}
											str+='</ul>';
											str+='</ul>';
											console.log(jfutype);
											if("2"==jfutype){
												if(5==fdstate||6==fdstate||7==fdstate){
													str+='<button type="button" class="bg_gray" id="'+jp+'">已结束</button>';
												}else{
													//则按钮变灰，按钮内的字变为“已抢完”，并且不可点击   applicationnum   fishnum
													if(applicationnum>=releasenum){
														str+='<button type="button" class="bg_gray" id="'+jp+'">已抢完</button>';
													}
						// 							当结束日期表红时，按钮按照设计图则变为橙色，并且按钮内的字变为“马上抢拍”
													else if(5>=intDay&&intDay>=0){
													  if(4==jfustate){
													  	str+='<button type="button" class="bg_orange" id="'+jp+'">马上抢拍</button>';
													  }else{
														 
													  	str+='<button type="button" class="bg_gray" id="'+jp+'">马上抢拍</button>';
													  }
													}
						// 					                     如果需求已经结束，则按钮变灰，按钮内的字变为“已结束”
													else if(intDay<0){
													    str+='<button type="button" class="bg_gray" id="'+jp+'">已结束</button>';
													}
													else{
														 if(4==jfustate){
														 	str+='<button type="button" class="bg_blue" id="'+jp+'">立即竞拍</button>';
														 }else{
														 	str+='<button type="button" class="bg_gray" id="'+jp+'">立即竞拍</button>';
														 }
													}
												}
												
											}
											str+='</div>';
											str+='</div>';
											$("#search_reslut").append(str);
											if("2"==jfutype){
												 if(5==fdstate||6==fdstate||7==fdstate){
												    
												    
												 }else{
														 if(4==jfustate){
														    //则按钮变灰，按钮内的字变为“已抢完”，并且不可点击
															if(applicationnum>=releasenum){
		
															}
								                            //当结束日期表红时，按钮按照设计图则变为橙色，并且按钮内的字变为“马上抢拍”
															else if(5>=intDay&&intDay>=0){
																$("#" + jp).click(function(){
																	gotoDetail(demandid);
																});
															}else if(intDay<0){
                                                            //如果需求已经结束，则按钮变灰，按钮内的字变为“已结束”
		
															}else if(5==fdstate||6==fdstate||7==fdstate){
														    
															}else{
																$("#" + jp).click(function(){
																	gotoDetail(demandid);
																});
															}
													    }else{
													    		$("#" + jp).click(function(){
																	gotoDetail(demandid);
																});
													    }
												 }   
											}
										});
									}
									document.getElementById("page").innerHTML=r.ajaxPageStr;
									//免，新 图标效果
						    		$(".deman_hall_search .reslut_box .progress_bar li").hover(function(){
						    			$(this).find("p").toggle();
						    		});
						    		//点击翻页跳转到顶部
									$(".page a").click(function(){
							            $('html,body').animate({scrollTop: '0px'}, 0);
							        });
							}else{
							    $("#search_reslut").addClass("no-reslut");
								$("#search_reslut").html("加载失败!");
// 								document.getElementById("search_reslut").innerHTML="加载失败!";
								document.getElementById("page").innerHTML="";
							}
					});
		  	}


		  	$(document).ready(function(){
// 			  	 if("2"==jfutype){
// 			  		  var ztseach=document.getElementById("ztseach").value;
// 			  		  if("supplier_lj_demandHall"==ztseach){
// 					  	    document.getElementById("ordername").value=document.getElementById("sorderName").value;
// 					  	    seachDemandHall();
// 				  	  }else{
// 				  	  		getDemandHall("");
// 				  	  }
// 			  	 }else{
			  	   		    getDemandHall("");
// 			  	 }
			});
			
		</script>


<style>
.content_right {
    width: auto;
    height: 100%;
    margin-left: 0;
}
</style>
<div class="topNav"></div>

    		<div class="mid_box">
				<div class="content_right" >
					<input type="hidden" name="currentPage" id="currentPage" value="1">
					<div class="deman_hall_box border-gray">
						<div class="box" >
							<p>面向行业:</p>
							<ul id="box1">
								<li class="selected" data="">全部</li>
						
								
								<li data="教育培训">教育培训</li>
								<li data="汽车行业">汽车行业</li>
								<li data="医美行业">医美行业</li>
								<li data="房地产">房地产</li>
								<li data="金融">金融</li>
								<li data="电商">电商</li>
								<li data="其他">其他</li>
							</ul>
						</div>
						<div class="box">
							<p>业务类型:</p>
							<ul  id="box2">
								<li class="selected" data="">全部</li>
								<li data="销售线索挖掘">销售线索挖掘</li>
								<li data="数据加工">数据加工</li>
								<li data="标签匹配">标签匹配</li>
							</ul>
						</div>
						<div class="box open" >
							<p>目标城市:</p>
							<ul class="open" id="box3">
								<li class="selected" data="">全部</li>
								
								<li data="北京">北京</li>
								<li data="上海">上海</li>
								<li data="广州">广州</li>
								<li data="深圳">深圳</li>
								<li data="杭州">杭州</li>
								
								
								<li data="一线城市">一线城市</li>
								<li data="全国">全国</li>

							</ul>
						</div>
		
						<div class="box" >
							<p>需求状态:</p>
							<ul id="box5">
								<li class="selected" data="">全部</li>
								<li data="1">可竞拍</li>
								<li data="2">不可竞拍</li>
							</ul>
						</div>
						<div class="box"  id="box6price">
							<p>需求单价:</p>
							<ul id="box6">
								<li class="selected" data="">全部</li>
								<li data="1">0-30</li>
								<li data="2">30-60</li>
								<li data="3">60-100</li>
								<li data="4">100以上</li>
							</ul>
						</div>
					</div>

					<div class="deman_hall_search">
						<div class="search_box">
							<ul>
								<li  class="selected" id="allzh" data="">综合</li>
								<li  data="u.residualQuantity" id="residualQuantityid">剩余量<span class="sequence" id="residualQuantityspan">↓</span></li>
								<li  data="u.releasetime" id="releasetimeid">上架日期<span class="sequence" id="releasetimespan">↓</span></li>
								<li  data="u.orderprice" id="orderpriceid">单价<span class="sequence" id="orderpricespan" >↓</span></li>
							</ul>
							<div>
								<input type="text" placeholder="需求名称" name="ordername" id="ordername"/>
								<input type="text" placeholder="需求编号" name="demandid" id="demandid"/>
								<button type="button" id="btn_submit" onclick="seachDemandHall();" >确定</button>
							</div>
						</div>
						<div class="search_reslut" id="search_reslut">

						</div>
						<div class="page" id="page">
						</div>

					</div>
				</div>

    		</div>
    	</div>
    </div>

	<div class="footer_box"></div>

	<!-- jsp文件尾部和尾部 -->
<!-- 	include file="../cfooter.jsp"%> -->


<!---弹出层1--->
<div class="cover" style="display:none;">
	<div class="cover-box">
		<div class="title">提示<span class="close2"></span></div>
		<div class="context">您还未完善信息，无法竞拍订单！<a href="html/PerfectData.html">点此完善信息>></a></div>
		<div class="bt-choose">
			<button type="button" class="bg_blue">确定</button>
<!-- 			<button class="bg_gray">取消</button> -->
		</div>
	</div>
</div>
<div class="aside_bar"></div>
	<script src="../html/js/asideBar.js" type="text/babel"></script> 
   <script src="../html/js/header-customerHall.js" type="text/babel"></script>
	 <script src="../html/js/header-supplierHall.js" type="text/babel"></script>
<script src="../html/js/footer.js" type="text/babel"></script>



    <script>
    	jQuery(function(){
    	    if(4!=jfustate){
		      document.getElementById("orderpriceid").style.display="none";
		      document.getElementById("box6price").style.display="none";
		    }else{
		      document.getElementById("orderpriceid").style.display="";
		      document.getElementById("box6price").style.display="";
		    }
    		//面向行业点击蓝色效果
    		$(".deman_hall_box .box ul li").click(function(){
    			$(this).addClass("selected").siblings().removeClass("selected");
    			getDemandHall("");
    		});

    		//搜索框点击效果
    		$(".deman_hall_search .search_box ul li").click(function(){
    			$(this).addClass("selected").siblings().removeClass("selected");
    			if($(this).find(".sequence").text()=="↑"){
    				$(this).find(".sequence").text("↓");
    			}else if($(this).find(".sequence").text()=="↓"){
    				$(this).find(".sequence").text("↑");
    			}
    			getDemandHall("");
    		});
    		//展开，收起点击效果
    		$(".deman_hall_box .box span").click(function(){
    			var oUl = $(".deman_hall_box .box ul.open").height();
			    if($(this).hasClass("open")){
				    $(this).addClass("closed");
	    			$(this).parent().animate({
	    				height: oUl
	    			});
	    			$(this).text("收起");
				    $(this).removeClass("open");
			    }else{
				    $(this).removeClass("closed");
		  			$(this).addClass("open");
	    			$(this).parent().animate({
	    				height:29
	    			});
	    			$(this).text("展开");
				    $(this).addClass("open");
			    }
    		});

    		//弹出层点击关闭
    		$(".cover-box .title1 span,.cover-box .title span,.cover-box .bt-choose button.bg_blue,.cover-box .bt-choose button.bg_gray").click(function(){
    			$(".cover").hide();
    		});
    	});
    </script>
</body>
</html>
