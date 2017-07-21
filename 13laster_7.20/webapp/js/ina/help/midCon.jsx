class HelpCon extends React.Component{
	constructor(props) {
		super(props);
		this.init();
	}
	init(){
	}
	componentDidMount(){
		$(function(){
	        var $div_li =$("div.tab_menu ul li");
	        $div_li.click(function(){
	            $(this).addClass("selected").siblings().removeClass("selected");
				$(this).parent().addClass("selected").siblings().removeClass("selected");
	            var index = $div_li.index(this);
	            $("div.tab_box > div").eq(index).show().siblings().hide();
				$(".breadcrumb span").text($(this).parent().prev().text());
				if($(".tab_menu ul").hasClass("selected")){
					
				}else{
					console.log($(this));
				}
	        });
			$(".tab_menu h3").click(function(){
				$(this).next().slideToggle();
			});
	    })
	}
	render(){
		return (<main>
		<div className="about-box">
			<div className="tab_menu">
				<p>帮助中心</p>
				<h3>账号密码</h3>
		        <ul className="selected">
		            <li className="selected left-nav11">注册眸事账号</li>
		            <li className="left-nav12">注册常见问题</li>
					<li className="left-nav13">忘记密码</li>
		        </ul>
				<h3>资质认证</h3>
		        <ul>
		            <li className="left-nav21">合作流程</li>
		            <li className="left-nav22">三证</li>
		        </ul>
				<h3>业务相关</h3>
		        <ul>
		            <li className="left-nav31">测试</li>
		            <li className="left-nav32">发布需求</li>
					<li className="left-nav33">销售线索模板</li>
		            <li className="left-nav34">如何定价</li>
					<li className="left-nav35">获取销售线索</li>
		            <li className="left-nav36">结算</li>
		        </ul>
				<h3>其他问题</h3>
		        <ul>
		            <li className="left-nav41">其他常见问题</li>
		        </ul>
		    </div>
		    <div className="breadcrumb">
		   		<a href="index.html">首页</a>
		   		<a href="">帮助中心</a>
		   		<span>账号密码</span>
		    </div>
		    <div className="tab_box"> 
		        <div>
		        	<h1>注册眸事账号</h1>
					<p>进入眸事官网，点击右上方注册按钮，按照页面指引填写注册信息，即可完成注册。<a className="help-reg" href="register-customer.html">点此马上注册>></a></p>
					<p className="img" style={{"padding-top":"26px"}}><img src="/images/help/sign_up_pic.png" /></p>
		        </div>
		        <div className="hide">
		        	<h1>注册常见问题</h1>
					<h3 style={{"padding-top":"16px"}}>注册时，收不到短信验证码怎么办？</h3>
		        	<p>收不到短信验证码常见有以下几种原因：</p>
					<p>1，运营商服务器出现小问题，网络延迟等；可以稍作等待或致电运营商客服电话进行申报处理；</p>
					<p>2，手机设置了黑名单和信息拦截；重新进行信息拦截设置，去掉黑名单拦截；</p>
					<p>3，所处位置信号不好；检查手机信号，到信号良好的地方稍作等待试试；</p>
					<p>4，手机欠费。</p>
					<h3 style={{"padding-top":"25px"}}>注册手机号就是我的联系手机号吗？</h3>
					<p>不是的。注册手机号只作为登录时的账号使用，联系手机号需要登录以后再行添加。</p>
		        </div>
				<div className="hide">
		        	<h1>忘记密码</h1>
		        	<p>1，忘记登录密码时，可以在登录框内点击“忘记密码”进入找回密码流程；</p>
					<p className="img" style={{"padding":"16px 0 30px 0"}}><img src="/images/help/sign_up_problem_pic1.png" /></p>
					<p>2，在找回密码页面时，输入您的注册手机号或者邮箱（老用户部分账号是邮箱注册的）后，选择对应的找回方式，
并验证信息后，即可找回密码；</p>
					<p className="img" style={{"padding":"16px 0 30px 0"}}><img src="/images/help/sign_up_problem_pic2.png" /></p>
		        </div>
				<div className="hide">
		        	<h1>合作流程</h1>
		        	<p>1，注册眸事账号，并登录；</p>
		        	<p>2，打开我的信息页面，并填写企业认证相关信息；</p>
					<p className="img" style={{"padding":"16px 0 5px 0"}}><img src="/images/help/certify_pic1.png" /></p>
					<p className="img" style={{"padding":"5px 0 30px 0"}}><img src="/images/help/certify_pic2.png" /></p>
					<p>3，提交填写的相关信息，然后等待客服人员进行认证；</p>
					<p>4，认证通过后，就可以在平台发布获客需求了；</p>
					<p>5，认证失败也不要担心，可能是有些信息填写得不规范，客服人员会协助您填写相关信息；</p>
		        </div>
				<div className="hide">
		        	<h1>三证</h1>
		        	<h3>为什么要上传三证？</h3>
		        	<p>1，确认合作企业的合法性；</p>
		        	<p>2，为合作双方提供更多的保障；</p>
		        	<p>3，也是为了审核企业资质，确认企业是否具有相关行业的从业资质。</p>
					<h3 style={{"padding-top":"25px"}}>三证上传的之后会不会被泄露？</h3>
					<p>不会。公司会对每一个客户负责，严格保密合作企业的所有资料信息；另外公司网络也建立了防火墙，确保每个客户的资料都不会被盗用！</p>
					<h3 style={{"padding-top":"25px"}}>三证合一怎么办？</h3>
					<p>由于国家政策的实施，导致现在一部分企业进行了三证合一，而还有一部分企业没有进行三证合一；在平台上传三证时，可以自己选择是否三证合一，如果您公司是三证合一的话，则只需要上传三证合一之后的营业执照副本的彩色图片或扫描件即可；如果您公司没有三证合一，则需要上传三证的彩色图片或扫描件；</p>
		        </div>
				<div className="hide">
					<h1>测试</h1>
		        	<p>合作用户在平台正式发布获客需求之前，公司会针对用户的获客需求，先进行一次免费测试。</p>
					<h3 style={{"padding-top":"25px"}}>为什么要进行测试？</h3>
					<p>因为每个企业的品牌知名度，从事行业，客户人群要求以及品牌运营销售能力千差万别，眸事网可以首先进行免费的测试，依据测试结果会给到企业最合理的报价。</p>
					<h3 style={{"padding-top":"25px"}}>测试数据会提供给用户吗？</h3>
					<p>不会。平台会从测试结果中随机抽取一条录音样本提供给用户，以此让用户了解我们提供的销售线索的质量。因为测试是免费的，所以不会把测试的数据都给用户；而且测试的数量不会多，结果会有偶然性的发生，即使给到用户也效果不大，因此建议用户考虑进行200-300条数据的付费测试，可以更直观的了解到平台提供的销售线索的质量。</p>
				</div>
				<div className="hide">
					<h1>发布需求</h1>
					<h3>如何发布需求？</h3>
					<p>当您通过企业资质认证后，登录平台后即可发布您的获客需求，点击导航栏的发布需求菜单，即可进入发布需求流程。</p>
					<p className="img" style={{"padding":"16px 0 30px 0"}}><img src="/images/help/demand_pic1.png" /></p>
					<h3 style={{"padding-top":"25px"}}>只能发布教育行业的获客需求吗？</h3>
					<p>不是。我们平台现在主要做教育行业的获客需求，同时也会做一些别的行业的获客需求如汽车行业、金融行业、健康行业、互联网行业等等。不同的行业选择进入对应的需求发布频道，如下图所示：</p>
					<p className="img" style={{"padding":"16px 0 30px 0"}}><img src="/images/help/demand_pic2.png" /></p>
					<h3 style={{"padding-top":"25px"}}>选择区域时如何选择到不同的区域单位？</h3>
					<p>选择区域时，有三个不同的选项卡：选城市、选省份、选区域；三个选项卡分别可以选到对应的区域单位，值得说明的是：选择第三个选项卡“我要选区域”时，是可以选到如全国、一线城市、华东地区等区域单位的；</p>
					<p className="img" style={{"padding":"16px 0 30px 0"}}><img src="/images/help/demand_pic3.png" /></p>
				</div>
				<div className="hide">
					<h1>销售线索模板</h1>
					<p>用户在发布需求时，需要通过选择标签来建立自己的销售线索模板。</p>
					<h3 style={{"padding-top":"25px"}}>销售线索模板的用途是什么？</h3>
					<p>销售线索模板即是用户的获客需求所要求的信息，销售线索模板内的每一个标签都是需要被搜集的信息并最后提供给用户。平台会根据用户建立的销售线索模板制订专门的问卷，然后根据问卷去获取销售线索。</p>
					<h3 style={{"padding-top":"25px"}}>选不到自己要的信息字段怎么办？</h3>
					<p>如果在既有的选项中，用户选不到自己需要的信息字段时，可以通过点击“添加标签”来添加自定义的信息字段，每一个获客需求可以添加20个这样的信息字段，自定义添加的标签的价格需要和平台协商并最后确定。</p>
					<p className="img" style={{"padding":"16px 0 30px 0"}}><img src="/images/help/test_model_pic.png" /></p>
				</div>
				<div className="hide">
					<h1>如何定价?</h1>
					<p>因为每个企业的品牌知名度，从事行业，客户人群要求以及品牌运营销售能力千差万别，眸事网可以首先进行免费的测试，依据测试结果会给到企业最合理的报价。</p>
					<p>1，教育行业的定价是通过人工智能自动形成价格，也可以通过联系客服然后协商价格；</p>
					<p>2，汽车行业、金融行业等其他行业是用户自由定价，平台会适当协商；</p>
					<p>3，数据加工项目由平台统一定价。</p>
					<h3 style={{"padding-top":"25px"}}>定价后是否可以再修改？</h3>
					<p>定价完成并发布获客需求之后，后台客服会对发布的需求进行审核，审核通过的需求才算正式发布；而在需求正式发布之前，用户可以通过联系客服来及时修改议价；当需求正式发布之后，则不可以再修改价格。</p>
					<h3 style={{"padding-top":"25px"}}>发布获客需求时，自动形成的价格太高？</h3>
					<p>自动形成的价格是通过人工智能结合市场而最终得出的，这个价格是最接近市场平均价的价格；如果用户确实觉得这个价格过高，可以通过联系客服进行协商，协商的价格作为用户发布需求的最终价格。</p>
				</div>
				<div className="hide">
					<h1>获取销售线索</h1>
					<p>平台每日会把满足用户需求的获客销售线索上传到用户的平台账号内，用户只需自行下载即可得到销售线索数据。</p>
					<h3 style={{"padding-top":"25px"}}>如何下载销售线索数据？</h3>
					<p>用户登录平台后，点击“成单报表”，找到对应的获客需求，点击进去后即可下载销售线索数据；</p>
					<p className="img" style={{"padding":"16px 0 5px 0"}}><img src="/images/help/test_get_info_pic1.png" /></p>
					<p className="img" style={{"padding":"5px 0 5px 0"}}><img src="/images/help/test_get_info_pic2.png" /></p>
					<p className="img" style={{"padding":"5px 0 30px 0"}}><img src="/images/help/test_get_info_pic3.png" /></p>
					<h3>用户如何知道什么时候可以下载销售线索数据？</h3>
					<p>一般来说，平台每天都会上传销售线索数据到正在执行中的获客需求；当新的数据上传后，系统会给用户发送邮件和短信分别到用户在平台所留的邮箱和手机号码；同时，用户登录平台后，页面上也会提醒用户下载新的销售线索数据；</p>
					<p className="img" style={{"padding":"16px 0 30px 0"}}><img src="/images/help/test_get_info_pic4.png" /></p>
				</div>
				<div className="hide">
					<h1>结算</h1>
					<p>当一个获客需求被完成或者执行时间到了之后，平台会根据最后的实际提交给用户的数据量进行结算，具体的结算细则会在实体合同中载明。</p>
				</div>
				<div className="hide">
					<h1>其他常见问题</h1>
					<h3>平台销售线索数据来源正规吗？</h3>
					<p>平台拥有上海大数据中心发布的牌照，在数据的操作和处理上都是合法合规的。</p>
					<h3 style={{"padding-top":"25px"}}>目标查询是什么？</h3>
					<p>目标查询可以帮助用户筛选出平台数据库中拥有的符合用户需求的目标客群的数量；用户通过选择自身的行业或产品，并填写区域的要求，然后可以查询出符合用户需要的目标客群数量。</p>
					<h3 style={{"padding-top":"25px"}}>目标查询出来的结果有什么用？</h3>
					<p>用户可以选择查询出来的结果作为自己获客需求的获客源，使用查询结果作为获客源，可以更高效地获取销售线索，更能提高企业的销售转化率。</p>
				</div>
		    </div>
		</div>
		</main>);
	}
}
export default HelpCon;
