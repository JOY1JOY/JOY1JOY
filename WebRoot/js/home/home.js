/**
 * @author:xujun
 * @desc:首页主控制js
 */
$(document).ready(function() {
	// 加载活动
	home.get_newest_activities();
//	home.get_newest_kn_nt_pt();
//	home.get_newest_kn_nt_pt2();
	home.get_newest_join();
	// 配置轮播图
//	$(".banner-box").slide({
//		titCell : ".hd ul",
//		mainCell : ".bd ul",
//		effect : "fold",
//		interTime : 3500,
//		delayTime : 500,
//		autoPlay : true,
//		autoPage : true,
//		trigger : "click"
//	});
	
	 var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev',
	        paginationClickable: true,
	        spaceBetween: 60,
	        centeredSlides: true,
	        autoplay: 5000,
	        speed:500,
	        autoplayDisableOnInteraction: false
	    });
	 
	 $(".swiper-container").hover(
			  function(){ 
				   $(".swiper-button-prev").fadeIn(200);
				   $(".swiper-button-next").fadeIn(200);
				  },
				  function(){
				  $(".swiper-button-prev").fadeOut(200);
				  $(".swiper-button-next").fadeOut(200);
				  }
	 );
	 

});