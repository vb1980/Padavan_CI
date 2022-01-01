<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Padavan登录</title>
  <link rel="stylesheet" href="/login/login.css">
  <script type="text/javascript" src="/jquery.js"></script>
  <script>
    var $j = jQuery.noConflict();
    function basicB64Encode(user, password) {
      return 'Basic ' + btoa(encodeURIComponent(user.toString() + ':' + password.toString()).replace(/%([0-9A-F]{2})/g,
        function (match, p1) {
          return String.fromCharCode('0x' + p1);
        }));
    }
    
    function getRandom(start = 0, end = 7, fixed = 0) {
      var differ = end - start;
      var random = Math.random();
      return (start + differ * random).toFixed(fixed)
    }
    
    $j(function () {
      var bgClass = "bg" + getRandom();
      $j('body').addClass(bgClass);
      $j('#user,#pwd').on('focus', function () {
        $j('.login-box').addClass('no-opacity');
        $j(this).removeClass('error');
      }).on('blur', function () {
        if ($j.trim($j(this).val()).length == 0) {
          $j(this).addClass('error');
        }
        $j('.login-box').removeClass('no-opacity');
      });
      
      $j('#signin').on('click', function () {
        if (document.hidden) return false;
        var siginData = {
          'u': $j.trim($j('#user').val()),
          'p': $j.trim($j('#pwd').val())
        };
        if (siginData.u.length == 0) {
          $j('#user').addClass('error');
          return false;
        }
        if (siginData.p.length == 0) {
          $j('#pwd').addClass('error');
          return false;
        }
        var req;
        try {
          if (window.XMLHttpRequest)
            req = new XMLHttpRequest();
          else
            req = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
          req = null;
        }
        if (req != null) {
          req.open("HEAD", "/", true);
          req.setRequestHeader('Authorization', basicB64Encode(siginData.u, siginData.p));
          req.onreadystatechange = function () {
            if (req.readyState === 4) {
              window.location.href = "/"
            }
          }
          req.send(null);
        }
      });
    });
  </script>
</head>

<body>
  <div class="login-box">
    <img src="/images/favicon.png" class="avatar" alt="Avatar Image">
    <h1>Padavan登录</h1>
    <form>
      <label for="user">用户名</label>
      <input id="user" type="text" placeholder="输入用户名">
      <label for="pwd">密码</label>
      <input id="pwd" type="password" placeholder="输入密码">
      <input id="signin" type="submit" value="Sign In">
    </form>
    <div class="login-footer">Powered by <a href="https://github.com/vb1980" target="blank">vb1980</a></div>
  </div>
</body>

</html>
