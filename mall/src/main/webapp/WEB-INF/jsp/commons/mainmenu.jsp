<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="mainNav">
  <div class="navmenu">
    <div class="categories hover">
      <div class="dt"><a name="sfbest_hp_hp_menu_all" class="trackref topall" href="#">精选商品分类</a></div>
      <div id="allSort" class="dd"><div id="booksort">
  <div class="item"> <span class="i-master">
    <h3 class="dev">
   		<p class="fresh"></p>
       <a class="trackref" style="text-decoration:none;" fro_id="1" name="sfbest_Uhead_Uhead_menu_category1-hot0" target="_blank">食品饮料/保健食品</a>
    </h3>
     <ul class="subCat" id="hone"></ul>
    </span>
    <script type="text/javascript">
	    $(function(){
			 $.ajax({ 
  		       type:"POST", 
  		       url:"http://localhost:8888/index/mainmenu/378", 
  		       dataType:"json",      
  		       contentType:"application/json",               
  		       success : function(data){
  		    	   if(data.status == 200){
  		    		   //window.location.href = "http://localhost:8888/cart/cart";
  		    	   		 for(var i =0;i<data.data.length;i++){
  		    	   		 	$('#hone').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
  		    	   			$('#hone1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
  		    	   		 	$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href="/search/cate/'+data.data[i].itemCats[j].id+'">'+data.data[i].itemCats[j].name+'</a>');
  		    	   		 	}
  		    	   		 }
  		    	   }else{
  		    		   alert("出错了");
  		    	   }
  		       } 
  		   }); 
		
			 $.ajax({ 
	  		       type:"POST", 
	  		       url:"http://localhost:8888/index/mainmenu/558", 
	  		       dataType:"json",      
	  		       contentType:"application/json",               
	  		       success : function(data){
	  		    	   if(data.status == 200){
	  		    		   //window.location.href = "http://localhost:8888/cart/cart";
	  		    	   		 for(var i =0;i<data.data.length;i++){
	  		    	   		 	$('#htwo').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
	  		    	   			$('#htwo1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
	  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
	  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href=/search/cate/'+data.data[i].itemCats[j].id+'>'+data.data[i].itemCats[j].name+'</a>');
	  		    	   		 	}
	  		    	   		 }
	  		    	   }else{
	  		    		   alert("出错了");
	  		    	   }
	  		       } 
	  		   }); 
			 $.ajax({ 
	  		       type:"POST", 
	  		       url:"http://localhost:8888/index/mainmenu/161", 
	  		       dataType:"json",      
	  		       contentType:"application/json",               
	  		       success : function(data){
	  		    	   if(data.status == 200){
	  		    		   //window.location.href = "http://localhost:8888/cart/cart";
	  		    	   		 for(var i =0;i<data.data.length;i++){
	  		    	   		 	$('#hthree').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
	  		    	   			$('#hthree1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
	  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
	  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href="/search/cate/"'+data.data[i].itemCats[j].id+'>'+data.data[i].itemCats[j].name+'</a>');
	  		    	   		 	}
	  		    	   		 }
	  		    	   }else{
	  		    		   alert("出错了");
	  		    	   }
	  		       } 
	  		   }); 
			 $.ajax({ 
	  		       type:"POST", 
	  		       url:"http://localhost:8888/index/mainmenu/249", 
	  		       dataType:"json",      
	  		       contentType:"application/json",               
	  		       success : function(data){
	  		    	   if(data.status == 200){
	  		    		   //window.location.href = "http://localhost:8888/cart/cart";
	  		    	   		 for(var i =0;i<data.data.length;i++){
	  		    	   		 	$('#hfour').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
	  		    	   			$('#hfour1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
	  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
	  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href="/search/cate/"'+data.data[i].itemCats[j].id+'>'+data.data[i].itemCats[j].name+'</a>');
	  		    	   		 	}
	  		    	   		 }
	  		    	   }else{
	  		    		   alert("出错了");
	  		    	   }
	  		       } 
	  		   }); 
			 
			 $.ajax({ 
	  		       type:"POST", 
	  		       url:"http://localhost:8888/index/mainmenu/296", 
	  		       dataType:"json",      
	  		       contentType:"application/json",               
	  		       success : function(data){
	  		    	   if(data.status == 200){
	  		    		   //window.location.href = "http://localhost:8888/cart/cart";
	  		    	   		 for(var i =0;i<data.data.length;i++){
	  		    	   		 	$('#hfive').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
	  		    	   			$('#hfive1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
	  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
	  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href="/search/cate/"'+data.data[i].itemCats[j].id+'>'+data.data[i].itemCats[j].name+'</a>');
	  		    	   		 	}
	  		    	   		 }
	  		    	   }else{
	  		    		   alert("出错了");
	  		    	   }
	  		       } 
	  		   }); 
			 $.ajax({ 
	  		       type:"POST", 
	  		       url:"http://localhost:8888/index/mainmenu/74", 
	  		       dataType:"json",      
	  		       contentType:"application/json",               
	  		       success : function(data){
	  		    	   if(data.status == 200){
	  		    		   //window.location.href = "http://localhost:8888/cart/cart";
	  		    	   		 for(var i =0;i<data.data.length;i++){
	  		    	   		 	$('#hsix').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
	  		    	   			$('#hsix1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
	  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
	  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href="/search/cate/"'+data.data[i].itemCats[j].id+'>'+data.data[i].itemCats[j].name+'</a>');
	  		    	   		 	}
	  		    	   		 }
	  		    	   }else{
	  		    		   alert("出错了");
	  		    	   }
	  		       } 
	  		   }); 
			 $.ajax({ 
	  		       type:"POST", 
	  		       url:"http://localhost:8888/index/mainmenu/749", 
	  		       dataType:"json",      
	  		       contentType:"application/json",               
	  		       success : function(data){
	  		    	   if(data.status == 200){
	  		    		   //window.location.href = "http://localhost:8888/cart/cart";
	  		    	   		 for(var i =0;i<data.data.length;i++){
	  		    	   		 	$('#hseven').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
	  		    	   			$('#hseven1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
	  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
	  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href="/search/cate/"'+data.data[i].itemCats[j].id+'>'+data.data[i].itemCats[j].name+'</a>');
	  		    	   		 	}
	  		    	   		 }
	  		    	   }else{
	  		    		   alert("出错了");
	  		    	   }
	  		       } 
	  		   }); 
			 
			 $.ajax({ 
	  		       type:"POST", 
	  		       url:"http://localhost:8888/index/mainmenu/903", 
	  		       dataType:"json",      
	  		       contentType:"application/json",               
	  		       success : function(data){
	  		    	   if(data.status == 200){
	  		    		   //window.location.href = "http://localhost:8888/cart/cart";
	  		    	   		 for(var i =0;i<data.data.length;i++){
	  		    	   		 	$('#height').append('<li><a href="#" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></li> ');
	  		    	   			$('#height1').append('<dl id=h'+data.data[i].itemCat.id+'></dl>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dt><strong><a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" style="text-decoration:none;" target="_blank">'+data.data[i].itemCat.name+'</a></strong></dt>');
	  		    	   			$('#h'+data.data[i].itemCat.id).append('<dd id=hz'+data.data[i].itemCat.id+'></dd>');
	  		    	   		 	for(var j =0;j<data.data[i].itemCats.length;j++){
	  		    	   		 		$('#hz'+data.data[i].itemCat.id).append('<a name="sfbest_Uhead_Uhead_menu_category1-2" class="trackref" href="/search/cate/"'+data.data[i].itemCats[j].id+'>'+data.data[i].itemCats[j].name+'</a>');
	  		    	   		 	}
	  		    	   		 }
	  		    	   }else{
	  		    		   alert("出错了");
	  		    	   }
	  		       } 
	  		   }); 
		});
    </script>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="hone1">
        </div>
        <a name="sfbest_Uhead_Uhead_menu_category1-banner" class="trackref" href="#" target="_blank">
        <div class="i-img"><img src="/images/html/1463455028.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
  <div class="item"> <span class="i-master">
    <h3 class="dev">
      <p class="baby"></p>
      <a class="trackref" name="sfbest_hp_hp_menu_category2-hot1" href="/search/cate/558" fro_id="2" target="_blank">手机</a></h3>
    <ul class="subCat" id="htwo">
      
    </ul>
    <s></s> </span>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="htwo1">
		    
        </div>
        <a name="sfbest_hp_hp_menu_category2-banner" class="trackref" href="#" target="_blank">
        <div class="i-img"><img src="/images/html/1463456854.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
  <div class="item"> <span class="i-master">
    <h3 class="dev">
      <p class="pastry"></p>
      <a class="trackref" href="/search/cate/161" fro_id="3" target="_blank" name="sfbest_hp_hp_menu_category3-hot0">电脑/办公</a></h3>
    <ul class="subCat" id="hthree">
    </ul>
    <s></s> </span>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="hthree1">
        </div>
        <a name="sfbest_Uhead_Uhead_menu_category3-banner" class="trackref" href="#" target="_blank">
        <div class="i-img"><img src="/images/html/1468837571.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
  <div class="item"> <span class="i-master">
    <h3 class="dev">
      <p class="drinks"></p>
      <a class="trackref" href="/search/cate/249" fro_id="4" target="_blank" name="sfbest_hp_hp_menu_category4-hot0">个护化妆</a></h3>
    <ul class="subCat" id="hfour">
    </ul>
    <s></s> </span>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="hfour1">
        </div>
        <a name="sfbest_Uhead_Uhead_menu_category4-banner" class="trackref" href="#" target="_blank">
        <div class="i-img"><img src="/images/html/1471311447.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
  <div class="item"> <span class="i-master">
    <h3 class="dev">
      <p class="food"></p>
      <a class="trackref" href="/search/cate/296" fro_id="5" target="_blank" name="sfbest_Uhead_Uhead_menu_category5-hot0">母婴</a></h3>
    <ul class="subCat" id="hfive">
    </ul>
    <s></s> </span>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="hfive1">
		  </div>
        <a name="sfbest_Uhead_Uhead_menu_category5-banner" class="trackref" href="#" target="_blank">
        <div class="i-img"><img src="/images/html/1472521250.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
  <div class="item"> <span class="i-master">
    <h3 class="dev">
      <p class="tea"></p>
      <a class="trackref" href="/search/cate/74" fro_id="6" target="_blank" name="sfbest_hp_hp_menu_category6-hot0">家用电器</a></h3>
    <ul class="subCat" id="hsix">
    </ul>
    <s></s> </span>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="hsix1">
        </div>
        <a name="sfbest_Uhead_Uhead_menu_category6-banner" class="trackref" href="#" target="_blank">
        <div class="i-img"><img src="/images/html/1472521203.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
  <div class="item"> <span class="i-master">
    <h3 class="dev">
      <p class="oil"></p>
      <a class="trackref" href="/search/cate/749" fro_id="3" target="_blank" name="sfbest_Uhead_Uhead_menu_category7-hot0">服饰内衣</a></h3>
    <ul class="subCat" id="hseven">
    </ul>
    <s></s> </span>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="hseven1">
        </div>
        <a name="sfbest_Uhead_Uhead_menu_category7-banner" class="trackref" href="#" target="_blank">
        <div class="i-img"><img src="/images/html/1472521236.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
  <div class="item"> <span class="i-master">
    <h3 class="dev">
      <p class="health"></p>
      <a class="trackref" href="/search/cate/903" fro_id="8" target="_blank" name="sfbest_Uhead_Uhead_menu_category8-hot0">礼品箱包
	  </a></h3>
    <ul class="subCat" id="height">
    </ul>
    <s></s> </span>
    <div class="i-cm">
      <div class="i-left">
        <div class="cat-sort" id="height1">
		    </div>
        <a name="sfbest_Uhead_Uhead_menu_category8-banner" class="trackref" href="#" target="_blank">
		<div class="i-img"><img src="/images/html/1471311388.jpg"></div>
        </a> </div>
      <div class="i-right"> <span onclick="$('.item').removeClass('hover')" class="i-close"></span> </div>
    </div>
  </div>
</div>
</div>
</div>
  
    <!----menufloat------->
    <div class="menu1">
      <ul>
            <li><a name="sfbest_Uhead_Uhead_nav_nav1" class="trackref" href="${pageContext.request.contextPath}/index">首页</a></li>
            <li id="cat1"><a name="sfbest_Uhead_Uhead_nav_nav2" href="/search/cate/378" class="trackref">食品饮料、保健食品</a></li>
			<li id="cat2"><a name="sfbest_Uhead_Uhead_nav_nav3" href="/search/cate/558" class="trackref">手机</a></li>
			<li id="cat3"><a name="sfbest_Uhead_Uhead_nav_nav4" href="/search/cate/161" class="trackref">电脑、办公</a></li>
			<li id="cat4"><a name="sfbest_Uhead_Uhead_nav_nav5" href="/search/cate/249" class="trackref">个护化妆</a></li>
			<li id="cat5"><a name="sfbest_Uhead_Uhead_nav_nav6" href="/search/cate/296" class="trackref">母婴</a></li>
			<li id="cat6"><a name="sfbest_Uhead_Uhead_nav_nav7" href="/search/cate/74" class="trackref">家用电器</a></li>
			<li id="cat6"><a name="sfbest_Uhead_Uhead_nav_nav7" href="/search/cate/749" class="trackref">服饰内衣</a></li>
			<li id="cat6"><a name="sfbest_Uhead_Uhead_nav_nav7" href="/search/cate/903" class="trackref">礼品箱包</a></li>
      </ul>
    </div>
    <span class="clear"></span>
  </div>
</div>