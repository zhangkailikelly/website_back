class Pop extends React.Component{
	constructor(props) {
		super(props);
	}
	componentDidMount(){
		/*
		
		$(".userlist li.first a").click(function(){
			if(sessionStorage.getItem("jfustate")=="4"){
				location.href =  'customer_new_demand.html';
			}else{
				$(".cover").show();
			}
		});
		*/
		
		function whetherDown(callBack){
		/*查看是有下载*/
			callBack = callBack || function (){};
			var url = domain + "/report/f";
			
			$.when($.ajax({
				 url:url,
				 type:"get",
				 contentType:'application/json',
				 data:{
				  "jfuid":sessionStorage.getItem("jfuid"),
				 }
			})).then(function (data){
				var ndcountHfd = data.ndcountHfd*1;
				var ndcountHfdf = data.ndcountHfdf*1;
				/*ndcountHfd 销售线索挖掘 ndcountHfdf 数据加工*/
				sessionStorage.setItem("notdownloadcount",(ndcountHfd+ndcountHfdf)); 
				
				callBack(data);
			}).fail(function (data){
				//alert('获取数据失败！');
			});
			
		//debugger;
		}
		whetherDown(function (data){
			var jfustate = $.sessionStorage('jfustate');
			if(jfustate == 4 && data.sump==0){
				/*通过审核 但是没有发过需求， 提示发需求*/
				var antModalMask = $.sessionStorage('ant-modal-mask');
				if(!antModalMask){
					$('.ant-modal-mask').show();
				}
				$.setSessionStorage('ant-modal-mask','ant-modal-mask');
				
			}
		});
		this.actionActive();
	}
	actionActive(){
		
		$('.wiseMore').click(function (){
			$('.ant-modal-mask').hide();
		});
		$('.ant-btn-primary').click(function (){
			location.href="https://www.mshuoke.com/html/customer_new_demand.html";
		});
		$('.modal-box .closed').click(function (){
			$('.ant-modal-mask').hide();
		});
		
	}
	render(){
		return (
				<div className="ant-modal-mask">
					 <div className="modal-box">
						<span>恭喜您，您上传的资料已经通过审核！</span>
						
						<span>您已经可以在平台发布获客需求了，赶紧试试吧！</span>
						<button type="button" className="ant-btn ant-btn-primary"><span>发布获客需求</span></button>
						<a className="wiseMore" herf="javascript:;">暂不发布需求，我想了解更多</a>
						<div className="closed"></div>
					 </div>
				</div>
				);
	}
}

export default Pop;