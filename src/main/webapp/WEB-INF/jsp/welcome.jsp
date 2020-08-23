<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/common.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<!--Main Navigation-->
<header>
<nav class="navbar navbar-expand-lg navbar-dark default-color-dark fixed-top">
    <a class="navbar-brand" href="/">Demo Portal</a>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
            <li class="nav-item">
                <a style="color:#FFFFFF" href="#">${pageContext.request.userPrincipal.name}</a>
            </li>
            <li class="nav-item">
            	<a class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a>
            </li>
         </ul>
         </div>
    </c:if>
</nav>
</header>


<style>
    body {font-family: Arial, Helvetica, sans-serif;}
    * {box-sizing: border-box;}

    /* Button used to open the chat form - fixed at the bottom of the page */
    .open-button {
        background-color: #555;
        color: white;
        padding: 16px 20px;
        border: none;
        cursor: pointer;
        opacity: 0.8;
        position: fixed;
        bottom: 23px;
        right: 28px;
        width: 150px;
    }

    /* The popup chat - hidden by default */
    .chat-popup {
        display: none;
        position: fixed;
        bottom: 0;
        right: 5px;
        border: 3px solid #f1f1f1;
        z-index: 9;
    }

    /* Add styles to the form container */
    .form-container {
        max-width: 300px;
        padding: 10px;
        background-color: white;
    }

    /* Full-width textarea */
    .form-container textarea {
        width: 100%;
        padding: 15px;
        margin: 5px 0 22px 0;
        border: none;
        background: #f1f1f1;
        resize: none;
        min-height: 200px;
    }

    /* When the textarea gets focus, do something */
    .form-container textarea:focus {
        background-color: #ddd;
        outline: none;
    }

    /* Set a style for the submit/send button */
    .form-container .btn {
        background-color: #4CAF50;
        color: white;
        padding: 16px 20px;
        border: none;
        cursor: pointer;
        width: 100%;
        margin-bottom:10px;
        opacity: 0.8;
    }

    /* Add a red background color to the cancel button */
    .form-container .cancel {
        background-color: red;
    }

    /* Add some hover effects to buttons */
    .form-container .btn:hover, .open-button:hover {
        opacity: 1;
    }
</style>
</head>
<body>

<button class="open-button" onclick="openForm()">Chat</button>

<div class="chat-popup" id="myForm">
    <form action="/action_page.php" class="form-container">

        <script src="https://cdn.botframework.com/botframework-webchat/master/webchat.js"></script>

        <div id="webchat" role="main">

            <script>
                (async function () {
                    const token = 'IchGsdcpMcg.VCB2Y1D0cZE0RqK8KXFjAFFdEYF8ydKLu4490rjU81c';

                    // You can modify the style set by providing a limited set of style options
                    const styleOptions = {
                        botAvatarImage: '${contextPath}/resources/image/WelcomeLogo.png',
                        botAvatarInitials: '',
                        userAvatarImage: '${contextPath}/resources/image/person.png',
                        userAvatarInitials: '',
                        bubbleBackground: 'rgba(0, 0, 255, .1)',
                        bubbleFromUserBackground: 'rgba(0, 255, 0, .1)'
                    };

                    // We are using a customized store to add hooks to connect event
                    const store = window.WebChat.createStore({}, ({ dispatch }) => next => action => {
                        if (action.type === 'DIRECT_LINE/CONNECT_FULFILLED') {
                            // When we receive DIRECT_LINE/CONNECT_FULFILLED action, we will send an event activity using WEB_CHAT/SEND_EVENT
                            dispatch({
                                type: 'WEB_CHAT/SEND_EVENT',
                                payload: {
                                    name: 'webchat/join',
                                    value: { language: window.navigator.language }
                                }
                            });
                        }
                        return next(action);
                    });

                    window.WebChat.renderWebChat({
                        directLine: window.WebChat.createDirectLine({ token }),
                        styleOptions,store
                    }, document.getElementById('webchat'));

                    document.querySelector('#webchat > *').focus();
                })().catch(err => console.error(err));
            </script>
        </div>
        <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
    </form>
    <script>
        function openForm() {
            document.getElementById("myForm").style.display = "block";
        }

        function closeForm() {
            document.getElementById("myForm").style.display = "none";
        }
    </script>
</div>

<script>
    function openForm() {
        document.getElementById("myForm").style.display = "block";
    }

    function closeForm() {
        document.getElementById("myForm").style.display = "none";
    }
</script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
