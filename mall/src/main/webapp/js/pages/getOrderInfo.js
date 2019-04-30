$(function(){
	$(".address").hover(function(){
		$(this).addClass("address-hover");	
	},function(){
		$(this).removeClass("address-hover");	
	});
})

$(function(){
//	$(".name").click(function(){
//		 //$(this).toggleClass("selected").siblings().removeClass("selected");
//		 if($(this).hasClass("selected")){
//			$(this).removeClass("selected");
//		 }else{
//			$(".name").removeClass("selected");
//			$(this).addClass("selected");
//			//$("#sendAddress").html($(".sAddr").val());
//		 }
//	});
	$(".payType li").click(function(){
		 $(this).toggleClass("selected").siblings().removeClass("selected");	
	});
})
