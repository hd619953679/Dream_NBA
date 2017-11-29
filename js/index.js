$(function(){
    //$("#header").load("head.html");
    $("#footer").load("foot.html");
var navInpt=document.getElementById("navbar-search");
     navInpt.addEventListener("focus",
         function(){
             this.className="form-control onfocus";
     });
     navInpt.addEventListener("blur",
         function(){
             this.className="form-control onblur";
         });
 //侧栏
 var btn=document.getElementById("btn"),
     back=document.getElementById("back-top"),
     aside=document.getElementById("aside"),
     bg = document.getElementById("show");
 btn.addEventListener("click",
     function(){
         if(this.className=="btn-st"){
             this.className="btn-st open";
             this.nextElementSibling.style.left="0";
         }else{
             this.className="btn-st";
             this.nextElementSibling.style.left="-340px";
         }
     });
 btn.addEventListener("mouseenter",
     function(){
         if(this.className=="btn-st")
         this.firstElementChild.className="glyphicon glyphicon-chevron-right";
         else
         this.firstElementChild.className="glyphicon glyphicon-chevron-left";
     });
 btn.addEventListener("mouseleave",
     function(){
         this.firstElementChild.className="glyphicon glyphicon-menu-hamburger";
     });
 window.addEventListener("scroll",
     function(){
         if((document.documentElement.scrollTop||document.body.scrollTop)>300){
             btn.style.display="block";
             aside.style.display="block";
         }
         else{
             btn.style.display="none";
             aside.style.display="none";
         }
         if((document.documentElement.scrollTop||document.body.scrollTop)>500)
             back.style.bottom="70px";
         else
             back.style.bottom="-40px";
 });
 window.addEventListener("scroll",
     function(){
         var  i=document.body.scrollTop||document.documentElement.scrollTop;
         if(i<500)
            bg.style.backgroundPosition="50%"+" "+(15-i/8)+"px";
 });

 //over

 //背景轮播
 +function(){
       var  url = getComputedStyle(bg).backgroundImage,
            i = url.lastIndexOf("."),
            n = 1;
        function task() {
            bg.style.backgroundImage = url.slice(0, i - 1) + n + url.slice(i);
            n++;
            if (n > 4) n = 1;
        }
     task();
     var timer = setInterval(task, 4500);

 }();
 //over
    //导航
    $("#team").click(function(e){

        $(".team-name").slideUp();
        if(!$(this).children().eq(1).is(":animated"))
        $(this).children().eq(1).slideToggle();
    });
    $(".team-list>li").click(function(e){
        e.stopPropagation();
        $(".team-name").slideUp(500);
            $(this).children().stop(true);
        $(this).children().slideToggle(500);
    });
    $(".team-name>li>a").click(function(e){
        e.stopPropagation();
    });


//back top
 back.addEventListener("click",function(){
      var timer = setInterval(function(){
          var cur = parseInt(document.body.scrollTop);
          //console.log(cur);
          var speed = cur/8;
          if(cur == 0){
              clearInterval(timer);
              timer=null;
          }else {
              document.body.scrollTop = cur - speed ;
          }
      },30)
 });
//asideMenu
    var spans=$("#list>li>span:nth-child(2)");
    spans.click(function(){
        if(!$(this).next().is(":animated")){
            $(this).next().slideToggle(500);//
            $(".list-2:not(:animated)").slideUp(500);
            if($(this).prev().text()==="+ "){
                $(this).prev().text("- ");
                if($(this).parent().prev().children().eq(0).text()==="- "){
                    $(this).parent().prev().children().eq(0).text("+ ");
                }
                else if($(this).parent().next().children().eq(0).text()==="- "){
                    $(this).parent().next().children().eq(0).text("+ ");
                }
            }else{
                $(this).prev().text("+ ");
            }
        }
    });
    //登录部分
+function(){
    $("#log-in").on('click','a',function(){
        if($(this).attr("id")==="qq"){
            $("#myModalLabel").text("使用QQ账号登陆");
        }else if($(this).attr("id")==="wx"){
            $("#myModalLabel").text("使用微信账号登陆");
        }else{
            $("#myModalLabel").text("使用微博账号登陆");
        }
    });
    $(".modal-body .ips").focus(function(){
        $(this).css("box-shadow","0 0 5px yellow");
    });
    $(".modal-body .ips").blur(function(){
        $(this).css("box-shadow","none");
    });
    //是否记住密码
    rememberMe.checked=localStorage['rememberMe'];
    if($("#upwd").val(localStorage['upwd'])) {
        $("#uname").val(localStorage['uname']);
        $("#upwd").val(localStorage['upwd']);
    }

    $("#login-btn").click(function(){
        login();
    });
    function login(){
        var uname=$("#uname").val();
        var upwd=$("#upwd").val();
        if(check(uname,upwd)){
            $.ajax({
                type: 'POST',
                url: 'php/login.php',
                data: {uname: uname, upwd: upwd},
                beforeSend:function(){
                    $("#loginTip").html('登录中...').removeClass('false')
                    .addClass('tip');
                },
                success: function(data){
                    if(data.code===1){
                        //登录成功
                        $('#myModal').modal('hide');
                        $("#log-in")[0].innerHTML=`
                                欢迎您!&nbsp;${uname}<br>
                                <a class="log-out" href="#">退出登录</a>
                            `;
                        $("#log-in").removeClass('login')
                            .addClass('loginOut');
                        if(rememberMe.checked){
                            localStorage['rememberMe']=true;
                            localStorage['uname']=uname;
                            localStorage['upwd']=upwd;
                        }else{
                            localStorage['rememberMe']=false;
                            localStorage.removeItem('uname');
                            localStorage.removeItem('upwd');
                        }
                    }else{
                        $("#loginTip").html(data.msg).removeClass('tip')
                            .addClass('false');//登录失败
                        $('#uname')[0].focus();
                    }
                }
            });
        }
    }
//退出登录
        $("#log-in").on('click','a.log-out',function(e){
            e.preventDefault();
            $.ajax({
                type:'POST',
                url:'php/loginOut.php',
                success:function(data){
                    //console.log(data);
                }
            });
            $("#log-in").removeClass('loginOut')
                .addClass('login');
            $("#log-in")[0].innerHTML=`
                    <a href="#myModal" data-toggle="modal" id="wb"></a>
                    <a href="#myModal" data-toggle="modal" id="qq"></a>
                    <a href="#myModal" data-toggle="modal" id="wx"></a>
                            `;
        });

    //验证帐号
        function check(uname,upwd){
            var regName=/^\w{3,10}[@]\w{1,6}[.]com([.]cn)?$/;
            var regPwd=/^.{6,18}$/;
            if(uname===''){
                $("#loginTip").html('请输入用户名!').removeClass('tip')
                    .addClass('false');
                $("#uname")[0].focus();
                return false;
            }
            if(!regName.test(uname)){
                $("#loginTip").html('请输入正确格式的用户名，为邮件地址').removeClass('tip')
                    .addClass('false');
                $("#uname")[0].focus();
                return false;
            }
            if(upwd===''){
                $("#loginTip").html('请输入密码!').removeClass('tip')
                    .addClass('false');
                $("#upwd")[0].focus();
                return false;
            }
            if(!regPwd.test(upwd)){
                $("#loginTip").html('请输入正确的格式的密码!').removeClass('tip')
                    .addClass('false');
                $("#upwd")[0].focus();
                return false;
            }
            return true;
        }

        //登录状态验证
        function isLogin(){
            $.ajax({
                type:'POST',
                url:'php/isLogin.php',
                success: function(data){
                    if(data[0]==='true'){
                       $("#log-in")[0].innerHTML=`
                                    欢迎您!&nbsp;${data[1]}<br>
                                    <a class="log-out" href="#">退出登录</a>
                                `;
                       $("#log-in").removeClass('login')
                           .addClass('loginOut');
                   }else{
                       $("#log-in").removeClass('loginOut')
                           .addClass('login');
                       $("#log-in")[0].innerHTML=`
                        <a href="#myModal" data-toggle="modal" id="wb"></a>
                        <a href="#myModal" data-toggle="modal" id="qq"></a>
                        <a href="#myModal" data-toggle="modal" id="wx"></a>
                                `;
                   }
                }
            });
        }
        isLogin();
}();//登录部分over

    //best play tab hover
   $(".title-tab>li").mouseover(function(){
       var w=parseInt($(this).css('width'));
       var offset=parseInt($('.tab-box').css('padding-left'));
       var i=$(".title-tab>li").index($(this));
       $(".title-tab>li").removeClass('active');
       $(this).addClass('active');
       $('.bt-line').css('width',w+'px').css('left',offset+i*w+'px');
       if($(this).hasClass('today')){
           $(".best-today-content").css('display','block');
           $(".best-season-content").css('display','none');
       }else{
           $(".best-today-content").css('display','none');
           $(".best-season-content").css('display','block');
       }
   });
//高清图部分
    +function() {
        var ulList = $(".img-list");
        var acImg = $('.img-list .ac-img');
        var imgBox = $('.img-box');
        var movedMD = 0;//md屏位移数
        var movedSM = 0;//sm屏位移数
        var movedXS = 0;//xs屏位移数
        var movedAimg = 0;//activeIMG的位移数
        var liWidth = parseFloat(getSCZ()[0]);
        $(window).on('resize', function (e) {
            $('.img-box').html('');
            liWidth = parseFloat(getSCZ()[0]);
            ulList.css('left', movedMD * liWidth + 'px');//校准ul的left
            acImg.css('left', movedAimg * liWidth + 'px');//校准activeIMG
            movedSM = movedMD;
            movedXS = movedMD;
            splitShowImg(movedAimg);
        });
        //左右播图
        $('.pic-content>span').click(function () {
            var sizes = getSCZ();//获取响应尺寸
            liWidth = parseFloat(sizes[0]);
            if ($(this).hasClass('toRight')) {
                if (sizes[1] >= 992) {
                    //console.log(movedMD);
                    if (movedMD > -4) {
                        movedMD--;
                        ulList.css('left', movedMD * liWidth + 'px');
                        //console.log(movedMD);
                    }
                    if (movedAimg < 7) {
                        movedAimg++;
                        acImg.css('left', movedAimg * (liWidth - 0.1) + 'px');
                        //console.log(movedAimg);
                        splitShowImg(movedAimg);
                    }
                } else if (sizes[1] >= 768) {
                    if (movedSM > -6) {
                        movedSM--;
                        ulList.css('left', movedSM * liWidth + 'px');
                    }
                } else {
                    if (movedXS > -7) {
                        movedXS--;
                        ulList.css('left', movedXS * liWidth + 'px');
                    }
                }
                //右
            } else {
                //左
                if (sizes[1] >= 992) {
                    if (movedMD < 0) {
                        movedMD++;
                        ulList.css('left', movedMD * liWidth + 'px');
                        //console.log(movedMD);
                    }
                    if (movedAimg > 0) {
                        movedAimg--;
                        acImg.css('left', movedAimg * (liWidth - 0.1) + 'px');
                        //console.log(movedAimg);
                        splitShowImg(movedAimg);
                    }
                } else if (sizes[1] >= 768) {
                    if (movedSM < 0) {
                        movedSM++;
                        ulList.css('left', movedSM * liWidth + 'px');
                    }
                } else {
                    if (movedXS < 0) {
                        movedXS++;
                        ulList.css('left', movedXS * liWidth + 'px');
                    }
                }
            }
        });

        var k = 0;
        $('.img-list>li>div.ac-img').click(function (e) {
            e.stopPropagation();
            k = parseFloat($('.img-list>li>.ac-img').css('left')) / (liWidth - 0.1);
            k = parseInt(k);
            movedAimg = k;
        });
        $('.img-list>li').click(function () {
            k = $('.img-list>li').index($(this));
            movedAimg = k;
            acImg.css('left', k * (liWidth - 0.1) + 'px');
            splitShowImg(k);
        });

        var xCount = 10;//水平分割数
        var yCount = 6;
        var animateBase = ['bounce', 'flash', 'pulse', 'rubberBand', 'shake',
            'swing', 'tada', 'wobble', 'jello', 'bounceIn', 'bounceInLeft',
            'bounceInRight', 'lightSpeedIn', 'flip', 'rollIn', 'bounceInUp'];

        function splitShowImg(movedAimg) {
            var frag = document.createDocumentFragment();
            var fatherW = parseFloat(imgBox.parent().css('width')).toFixed(4);
            imgBox.css({
                'width': fatherW + 'px',
                'height': (fatherW * 768 / 1366) + 'px'
            });
            var selfH = parseFloat(imgBox.css('height'));
            //console.log(selfH);
            for (var m = 0; m < xCount; m++) {
                for (var n = 0; n < yCount; n++) {
                    var no = parseInt(Math.random() * 16);
                    var div = $(`<div class="obj animated ${animateBase[no]}"></div>`);
                    div.css({
                        'width': (fatherW / xCount).toFixed(0) + 'px',
                        'height': (parseFloat(imgBox.css('height')) / yCount).toFixed(0) + 'px'
                    });
                    var l = m * parseFloat(div.css('width')).toFixed(0);
                    var t = n * parseFloat(div.css('height')).toFixed(0);
                    var bannerImg = $('.img-list img').eq(movedAimg);
                    var url = bannerImg.attr('src');
                    div.css({
                        'top': t + 'px',
                        'left': l + 'px'
                    });
                    div.css({
                        'background': `url("${url}") no-repeat -${l}px -${t}px
                 / ${fatherW}px ${selfH}px`
                    });
                    //console.log(div[0]);
                    $(frag).append(div[0]);
                }
            }
            $('.img-box').append($(frag));
        }
        splitShowImg(movedAimg);
    }();


    //响应式布局
    function getSCZ(){
        var scW=document.documentElement.clientWidth || document.body.clientWidth;
        $("#player .playerDropMenu").css('width',scW*.8);
        //console.log(scW);
        var boxW=parseFloat($(".pic-content").css('width'));
        //console.log(boxW);
        var lis=$(".img-list>li");
        if(scW<=767){
            lis.css('width',boxW+'px');
            $('.pic-content>span').css('fontSize','3.5rem')
                .css('top','40%');
        }else if(scW>=992){
            lis.css('width',boxW*0.25+'px');
        }else{
            lis.css('width',boxW*0.5+'px');
        }
        $(".pic-content").css('height',lis.eq(0).css('height'));
        var ulW=parseFloat(lis.eq(0).css('width'))*lis.length+10+'px';
        $(".img-list").css('width',ulW);
        var result=[lis.eq(0).css('width'),scW];
        return result;
    }

});//$fn  over








