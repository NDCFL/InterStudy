<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <title>贪吃蛇</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.cookie.js"></script>
    <style type="text/css">
        * {
            padding: 0;
            margin: 0;
        }

        table {
            border-collapse: collapse;
            border: 3px solid #0026ff;
        }

            table td {
                width: 33px;
                height: 33px;
            }

        #div0 {
            width: 795px;
            margin: 15px auto;
        }

        ul {
            list-style-type: none;
        }

        li {
            float: left;
            margin-left: 20px;
        }

        button {
            width: 120px;
            height: 30px;
            background-color: green;
            border-radius: 8px;
            color: white;
            outline: none;
            cursor: pointer;
            border: none;
            margin-top: 25px;
            font-weight: 600;
        }

            button:hover {
                background-color: lightgreen;
                color: black;
            }

        #div2 {
            margin-top: 250px;
        }

        select {
            width: 120px;
            height: 30px;
            margin-top: 25px;
        }

        p {
            font-size: large;
            font-weight: 600;
            color: blue;
        }
    </style>
    <script type="text/javascript">
        var base = { "LineOrColumn": 18, "InitLength": 5, "moveDirection": "right" ,"Speed":200};//为单元格长度、蛇初始长度、蛇的方向、蛇的速度
        var point = function (json) {
            var x, y, c;//x坐标，y坐标，c颜色
            if (json){
                x = json.x;
                y = json.y;
            }
            this.setC = function (_c) { c = _c }
            this.setX = function (_x) { x = _x }
            this.setY = function (_y) { y = _y }
            this.setD = function (_d) { d = _d }

            this.getX = function () { return x; }
            this.getY = function () { return y; }
            this.getC = function () { return c; }
        }
        var snake = function () {
            var length, ps;//length蛇的总长度，ps顺序为蛇尾至蛇头的point数组
            ps = new Array();

            this.setL = function (_l) { length = _l; }
            this.setPS = function (_p) { ps = _p; }

            this.getL = function () { return length; }
            this.getPS = function () { return ps; }

            this.move = function () {
                for (var i = 0; i < ps.length; i++) {
                    if (i == ps.length - 1) {
                        switch(base.moveDirection){
                            case "right":
                                ps[i].setX(ps[i].getX());
                                ps[i].setY(ps[i].getY()+1);
                                break;
                            case "down":
                                ps[i].setX(ps[i].getX()+1);
                                ps[i].setY(ps[i].getY());
                                break;
                            case "left":
                                ps[i].setX(ps[i].getX());
                                ps[i].setY(ps[i].getY()-1);
                                break;
                            case "up":
                                ps[i].setX(ps[i].getX()-1);
                                ps[i].setY(ps[i].getY());
                                break;
                        }
                    }
                    else {
                        ps[i].setX(ps[i + 1].getX());
                        ps[i].setY(ps[i + 1].getY());
                    }
                }
            }
        }
        var food = function () {
            var p;

            this.setP = function (_p) { p = _p; }

            this.getP = function () { return p; }
        }
        var chessboard = function () {
            var Snake, Food, Points;//蛇，食物，所有点

            Snake = new snake();
            Food = new food();
            Points = new Array();//所有的点
            
            this.getSnake = function () { return Snake; }
            this.getPoints = function () { return Points; }

            //初始化所有点
            var init = function () {
                for (var i = 0; i < base.LineOrColumn ; i++) {
                    for (var j = 0; j < base.LineOrColumn ; j++) {
                        if (!Points[i]) Points[i] = new Array();
                        var p = new point({ "x": i, "y": j });
                        Points[i][j] = p;
                    }
                }
            }

            //初始化蛇
            var initSnake = function () {
                var p1 = new Array();//用于初始化蛇
                for (var i = 0; i < base.InitLength;i++){
                    for (var j = 0; j < base.InitLength; j++) {
                        var p = new point({ "x": i, "y": j });
                        if (base.moveDirection == "right" && i == 0) {
                            p.setC("#" + ("00000" + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6));
                            p1.push(p);
                        }
                        else if (base.moveDirection == "down" && j == 0) {
                            p.setC("#" + ("00000" + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6));
                            p1.push(p);
                        }
                    }
                }
                Snake.setPS(p1);
            }

            //获得食物
            this.getFood = function () {
                var x, y;
               
                while (true) {
                    x = Math.floor(Math.random() * base.LineOrColumn);
                    y = Math.floor(Math.random() * base.LineOrColumn);
                    var p = new point({ "x": x, "y": y });
                    if (!verifyPoint(p)) {//判断该点不属于蛇
                        //将该点加入Food
                        p.setC("#" + ("00000" + (Math.random() * 0x1000000 << 0).toString(16)).slice(-6));
                        Food.setP(p);
                        break;
                    }
                }
                return Food;
            }

            //检验point对象是否属于食物
            var testPoint = function (p) {
                if (p.getX() == Food.getP().getX() && p.getY() == Food.getP().getY())
                    return true;
                else
                    return false;
            }

            //检验point对象是否属于食物,用于外部
            this.testPointOut = function (p) {
                if (p.getX() == Food.getP().getX() && p.getY() == Food.getP().getY())
                    return true;
                else
                    return false;
            }

            //获得和棋盘坐标相等的食物point
            var getFoodPoint = function (p) {
                if (p.getX() == Food.getP().getX() && p.getY() == Food.getP().getY())
                    return Food.getP();
            }

            //检验point对象属不属于蛇
            var verifyPoint = function (p) {
                var b=false;
                $(Snake.getPS()).each(function () {
                    if (this.getX() == p.getX() && this.getY() == p.getY()) {
                        b = true;
                    }
                });
                return b;
            }

            //检验point对象属不属于蛇,用于外部
            this.verifyPointOut = function (p) {
                var b = false;
                $(Snake.getPS()).each(function () {
                    if (this.getX() == p.getX() && this.getY() == p.getY()) {
                        b = true;
                    }
                });
                return b;
            }

            //获得和棋盘坐标相等的蛇身体point
            var getSnakePoint = function (p) {
                var pp;
                //方法一
                var ps = Snake.getPS();
                try{
                    for (var item in ps) {
                        if (ps[item].getX() == p.getX() && ps[item].getY() == p.getY()) {
                            pp = ps[item];
                            break;
                        }
                    }
                }
                catch(e){
                    alert(e.message);
                }

                //方法二
                //$(Snake.getPS()).each(function () {
                //    if (this.getX() == p.getX() && this.getY() == p.getY()) {
                //        pp = this;
                //    }
                //});
                return pp;
            }

            //获得table字符串，用于画出界面
            this.getInitGame = function (chessboard) {
                var table = new Array();
                table.push("<table>");
                for (var i = 0; i < base.LineOrColumn; i++) {
                    table.push("<tr>");
                    for (var j = 0; j < base.LineOrColumn; j++) {
                        var p=(chessboard.getPoints())[i][j];
                        table.push("<td id='" + p.getX().toString() + p.getY().toString() + "' style='background-color:" + (verifyPoint(p) ? getSnakePoint(p).getC(): (testPoint(p)?getFoodPoint(p).getC():"white")) + ";'></td>");
                    }
                    table.push("</tr>");
                }
                table.push("</table>");
                return table.join("");
            }

            init();
            initSnake();
        }

        //设置和获取cookie
        var cookie = {
            set: function (key, val, time) {//设置cookie方法
                var date = new Date(); //获取当前时间
                var expiresDays = time;  //将date设置为n天以后的时间
                date.setTime(date.getTime() + expiresDays * 24 * 3600 * 1000); //格式化为cookie识别的时间
                document.cookie = key + "=" + val + ";expires=" + date.toGMTString()+";path=/";  //设置cookie
            },
            get: function (key) {//获取cookie方法
                /*获取cookie参数*/
                var getCookie = document.cookie.replace(/[ ]/g, "");  //获取cookie，并且将获得的cookie格式化，去掉空格字符
                var arrCookie = getCookie.split(";")  //将获得的cookie以"分号"为标识 将cookie保存到arrCookie的数组中
                var tips;  //声明变量tips
                for (var i = 0; i < arrCookie.length; i++) {   //使用for循环查找cookie中的tips变量
                    var arr = arrCookie[i].split("=");   //将单条cookie用"等号"为标识，将单条cookie保存为arr数组
                    if (key == arr[0]) {  //匹配变量名称，其中arr[0]是指的cookie名称，如果该条变量为tips则执行判断语句中的赋值操作
                        tips = arr[1];   //将cookie的值赋给变量tips
                        break;   //终止for循环遍历
                    }
                }
                return tips;
            }
        }

        $(function () {
            var interval, maxLength=0;
            var cd = new chessboard();
            var snake = cd.getSnake();
            var food = cd.getFood();
            $("#div1").append(cd.getInitGame(cd));
            try {
                if ($.cookie("maxLength")) {
                    maxLength = parseInt($.cookie("maxLength"), 10);
                }
                $("#maxLength").text(maxLength);
            }
            catch (e) {
                alert(e.message);
            }
            var moveProcess=function(){
                snake.move();
                $("#div1").empty();
                eatFood();
                $("#div1").append(cd.getInitGame(cd));
                endGame();
            }
            //开始游戏
            var beginGame = function () {
                interval = setInterval(moveProcess, base.Speed);
            }
            //暂停游戏
            var pauseGame = function () {
                clearInterval(interval);
            }
            //判断是否撞了自己
            var verifySelf = function (p) {
                var b = false;
                var ps = snake.getPS();
                var length=ps.length-1;
                for (var i = 0; i < length;i++){
                    if (ps[i].getX() == p.x && ps[i].getY() == p.y) {
                        b = true;
                        break;
                    }
                }
                return b;
            }
            //判断是否吃了食物,如果是则添加在尾部
            var eatFood = function () {
                var length=snake.getPS().length-1;
                x0=snake.getPS()[length].getX();//蛇头
                y0=snake.getPS()[length].getY();
                x1=food.getP().getX();  //食物
                y1 = food.getP().getY();
                x2 = snake.getPS()[0].getX();//蛇尾
                y2 = snake.getPS()[0].getY();
                if (x0 == x1 && y0 == y1) {     
                    var p;
                    var direction = 0;
                    var b = false;
                    while(direction<4){
                        var x, y;
                        switch (direction) {
                            case 0:
                                x = x2;
                                y = y2 - 1;
                                break;
                            case 1:
                                x = x2 - 1;
                                y = y2;
                                break;
                            case 2:
                                x = x2;
                                y = y2 + 1;
                                break;
                            case 3:
                                x = x2 + 1;
                                y = y2;
                                break;
                        }
                        var p1 = new point({ "x": x, "y": y });
                        //尾部周围原有四个点可以选择，排除不是蛇身,排除越界
                        if (x > -1 && x < base.LineOrColumn && y > -1 && y < base.LineOrColumn && !cd.verifyPointOut(p1)) {
                            p = p1;
                            b = true;
                            break;
                        }
                        direction++;
                    }
                    if (b) {
                        p.setC(food.getP().getC());
                        snake.getPS().unshift(p);
                        food = cd.getFood();
                        $("#eat").get(0).play();
                        $("#SnakeLength").text(snake.getPS().length);
                    }
                    else {
                        alert("游戏出现bug！！");
                    }
                }
            }
            //判断是否违反游戏规则，结束游戏
            var endGame = function () {
                var x, y, length;
                length = snake.getPS().length - 1;
                x = snake.getPS()[length].getX();
                y = snake.getPS()[length].getY();
                //判断是否撞墙
                if (x > base.LineOrColumn - 1 || y > base.LineOrColumn - 1 || x < 0 || y < 0) {
                    $("#bgAudio").get(0).pause();
                    $("#die").get(0).play();
                    if (snake.getPS().length > maxLength) {
                        //cookie.set("maxLength", snake.getPS().length, 365);
                        $.cookie("maxLength", snake.getPS().length, { expires: 365, path: "/" });
                    }
                    alert("Game Over！！");
                    window.location.reload();
                }
                else if (verifySelf({ "x": x, "y": y })) {   //判断是否撞了自己的身体
                    $("#bgAudio").get(0).pause();
                    $("#die").get(0).play();
                    if (snake.getPS().length> maxLength) {
                        //cookie.set("maxLength", snake.getPS().length, 365);
                        $.cookie("maxLength", snake.getPS().length, { expires: 365, path: "/" });
                    }
                    alert("Game Over！！");
                    window.location.reload();
                }
            }
            //定义键盘事件
            $(window).keydown(function (e) {
                switch (e.keyCode) {
                    case 32:
                        $("#bgAudio").get(0).pause();
                        pauseGame();
                        break;
                    case 37:
                        if (base.moveDirection == "right")
                            break;
                        base.moveDirection = "left";
                        break;
                    case 38:
                        if (base.moveDirection == "down")
                            break;
                        base.moveDirection = "up";
                        break;
                    case 39:
                        if (base.moveDirection == "left")
                            break;
                        base.moveDirection = "right";
                        break;
                    case 40:
                        if (base.moveDirection == "up")
                            break;
                        base.moveDirection = "down";
                        break;
                }
            });
            //定义按钮事件
            $("button").each(function () {
                $(this).on("click", function () {
                    if ($(this).text() == "开始") {
                        switch ($("select").val()) {
                            case "较难":
                                base.Speed = 100;
                                break;
                            case "中级":
                                base.Speed = 200;
                                break;
                            case "简单":
                                base.Speed = 300;
                                break;
                        }
                        $("#bgAudio").get(0).play();
                        beginGame();
                    }
                    else {
                        $("#bgAudio").get(0).pause();
                        pauseGame();
                    }
                });
            });

        });
    </script>
</head>
<body>
    <audio id="bgAudio" src="MP3/Cut_01.mp3" loop></audio>
    <audio id="eat" src="MP3/si.mp3"></audio>
    <audio id="die" src="MP3/boing3.wav"></audio>
    <audio></audio>
    <div id="div0">
        <ul>
            <li><div id="div1"></div></li>
            <li>
                <div id="div2">
                    <p>
                        历史最长记录：<label><span id="maxLength" style="color:red;"></span></label>
                    </p>
                    <br />
                    <p>
                        当前长度：<label><span id="SnakeLength" style="color:red;">5</span></label>
                    </p>
                    <select>
                        <option>较难</option>
                        <option selected="selected">中级</option>
                        <option>简单</option>
                    </select>
                    <br />
                    <button>开始</button>
                    <br />
                    <button>暂停</button>
                </div>
            </li>
        </ul>
    </div>
</body>
</html>
