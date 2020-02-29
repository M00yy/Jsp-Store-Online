<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <title>登录后台</title>
        <link rel="stylesheet" type="text/css" href="../css/login.css" media="all">
        <link rel="stylesheet" type="text/css" href="../css/zui.css" media="all">
        <style type="text/css">
            html, body{
                width: 100%;
                height: 100%;
            }
            body{
                background:url(../images/login-bg.png) no-repeat center center;
                background-size: cover;
            }
            .login-text{
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 1111px;
                height: 55px;
                -webkit-background-size: cover;
                background-size: cover;
                z-index: 10;
            }
            .login-body{
                margin: 0;
                transform: translate(-50%, -50%);
                background: rgba(255, 255, 255, .6);
                z-index: 100;
            }
            .login-body .pr{
                height: auto;
            }
            .login-form{
                width: 300px;
            }
            .login-form h3{
                color: #333;
            }
        </style>
    </head>
    <body >
    <div class="login-text"></div>
    <div id="main-content">

        <!-- 主体 -->
        <div class="login-body">
            <div class="login-main pr">
                <form action="${pageContext.request.contextPath
                }/manager/ManagerServlet?operation=login" method="post" class="login-form">
                    <h3 class="welcome"><img class="logo" src="../images/login_logo.png"> 登陆后台</h3>
                    <div id="itemBox" class="item-box">
                        <div class="input-group user-name" >
                            <span class="input-group-addon"><i class="icon-user"></i></span>
                            <input type="text" name="username" class="form-control" placeholder="用户名">
                        </div>
                        <div class="input-group password">
                            <span class="input-group-addon"><i class="icon-lock"></i></span>
                            <input type="password" name="password"  class="form-control" placeholder="密码">
                        </div>


                    </div>
                    <div class="login_btn_panel">
                        <button class="login-btn" type="submit">
                            <span class="in"><i class="icon-loading"></i>登 录 中 ..</span>
                            <span class="on">登 录</span>
                        </button>
                        <div class="check-tips"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="/js/jquery-2.0.3.min.js"></script>

    <script type="text/javascript" src="/js/zui.js"></script>
    <script type="text/javascript">
        /* 登陆表单获取焦点变色 */
        $(".login-form").on("focus", "input", function(){
            $(this).closest('.item').addClass('focus');
        }).on("blur","input",function(){
            $(this).closest('.item').removeClass('focus');
        });

        //表单提交
        $(document)
            .ajaxStart(function(){
                $("button:submit").addClass("log-in").attr("disabled", true);
            })
            .ajaxStop(function(){
                $("button:submit").removeClass("log-in").attr("disabled", false);
            });

        $("form").submit(function(){
            var self = $(this);
            $.post(self.attr("action"), self.serialize(), success, "json");
            return false;

            function success(data){
                if(data.status){
                    window.location.href = data.url;
                } else {
                    var msg = new $.zui.Messager(data.info, {placement: 'bottom'});
                    msg.show();
                    //刷新验证码
                    $('[name=verify]').val('');
                    $(".reloadverify").click();
                }
            }
        });

        $(function(){
            //初始化选中用户名输入框
            $("#itemBox").find("input[name=username]").focus();
            //刷新验证码
            var verifyimg = $(".verifyimg").attr("src");
            $(".reloadverify").click(function(){
                if( verifyimg.indexOf('?')>0){
                    $(".verifyimg").attr("src", verifyimg+'&random='+Math.random());
                }else{
                    $(".verifyimg").attr("src", verifyimg.replace(/\?.*$/,'')+'?'+Math.random());
                }
            });

            //placeholder兼容性
            //如果支持
            function isPlaceholer(){
                var input = document.createElement('input');
                return "placeholder" in input;
            }
            //如果不支持
            if(!isPlaceholer()){
                $(".placeholder_copy").css({
                    display:'block'
                })
                $("#itemBox input").keydown(function(){
                    $(this).parents(".item").next(".placeholder_copy").css({
                        display:'none'
                    })
                })
                $("#itemBox input").blur(function(){
                    if($(this).val()==""){
                        $(this).parents(".item").next(".placeholder_copy").css({
                            display:'block'
                        })
                    }
                })
            }
        });
    </script>
    </body>
</html>