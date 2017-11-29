
$(function(){
    $("#footer").load("foot.html");
    var scW=document.documentElement.clientWidth;
    $("#player .playerDropMenu").css('width',scW*.8);
    $(window).on('resize', function (e) {
        var scW=document.documentElement.clientWidth;
        $("#player .playerDropMenu").css('width',scW*.8);
    });
    var navInpt=document.getElementById("navbar-search");
    navInpt.addEventListener("focus",
        function(){
            this.className="form-control onfocus";
        });
    navInpt.addEventListener("blur",
        function(){
            this.className="form-control onblur";
        });

//导航
    $("#team").click(function(){
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
                    type: 'GET',
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
                type:'GET',
                url:'php/loginOut.php',
                success:function(data){
                   // console.log(data);
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
                type:'GET',
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



});