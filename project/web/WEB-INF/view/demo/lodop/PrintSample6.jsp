﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WEB打印控件LODOP的样例六:打印多页文档</title>
<script language="javascript" src="../js/LodopFuncs.js"></script>
</head>
<body>

<h2><b><font color="#009999">演示打印多页文档:</font></b></h2>
<p><b>一、用15号大字体输出以下文档：</b><input type="button" value="打印预览" name="B3"  onclick="Preview()">
<input type="button" value="打印设计" name="B3" onclick="Design()">
<input type="button" value="打印维护" name="B3" onclick="Setup()"></p>                                                
                                               
<p><textarea rows="15" id="doc1" cols="102">千里难寻是朋友。
　　滚滚红尘，芸芸众生，能在同一时空相遇，已是一份机缘，如若能志趣相投，那便是朋友了。
　　人生不能无友。孔子说“无友不如己者”“有朋自远方来，不亦乐乎（Happy to greet a friend from afar ）。”在生活旅程中，朋友就像生活的阳光照耀着我们，温暖着我们。当我们满怀疲惫时，朋友的关爱似柔情的月光，给了我们甜蜜的慰籍和生存的坚强；当我们面对失败时，朋友的鼓励，给了我们拼搏的信心和向上的力量；当我们欢呼成功时，朋友的祝福，给了我们真诚的喜悦和前进的动力。从古到今，传诵着多少朋友情谊的佳话：俞伯牙和钟子期，嵇康和阮籍，李白和杜甫，鲁迅和瞿秋白等等。尤为令人称道的是管鲍之交，几千年来，论知心之交，必曰：管、鲍。

　　春秋时，齐国有两个人，一个叫管仲，字夷吾；一个叫鲍叔，字宣子。两人自幼时以贫贱结交。后来鲍叔先在齐桓公门下信用显达，就举荐管仲为相，位在己上。两人同心辅政，始终如一。管仲曾有几句言语道：“吾尝三战三北，鲍叔不以我为怯，知我有老母也；吾尝三仕三见逐，鲍叔不以我为不肖；知我不遇时也；吾尝与鲍叔为贾，分利多，鲍叔不以我为贪，知我贫也。生我者父母，知我者鲍叔也！”我每背诵此段话，都不由心声感慨，既感慨于他们那份难得的相知相与的友谊，也感慨于管仲对这份情谊的珍惜，更感慨于当今交友之道的世风日下。
　　古人结交惟结心，今人结交惟结面。明人陈继儒在《小窗幽记》里谈到交友之道时说“先淡后浓，先疏后亲，先达后近，交友道也。”而在当今，有的人在社会上交朋友比打个出租车还随便。或素未平生，交谈不过顷刻，完全不知底里，便视为“知心朋友”；或歌肆酒廊生意场相识，点点头递支烟酒杯一碰，醉意朦胧之中，便为“莫逆之交”；或旅途聚首，乍感气味相投，凭一时高兴，便当作“割头不换的生死朋友。这样的朋友正如古人所言“世人片言合，杯酒结新欢，生死轻相许，酒寒盟亦寒”用我们现在的话说是酒肉朋友是经不起时间的蒸发更经不起时间的蒸馏，是绝难长久的。

　　有一种朋友，是以互为利用作前提的，欧阳修在《朋党论》里说“小人所好者禄利也，所贪者财货也。当其同利之时，暂相党引以为朋者，伪也。”在现实中这样利用过了便散伙，榨不出油就撒手，刚才还“朋友”成一坨稀泥分不出彼此，转背就成了乌鸦麻雀不通语言的“伪朋友”者多矣。
　　或许你们经常在一起吃喝玩乐，看似十分投缘，有时他为你办件事，你也帮他办件事，其实各人心里都打着“小九九”，有时算计人情帐的声音都能听得见，这样的朋友是朋友吗？

或许你是个官，他以你的取舍为取舍，以你的好恶为好恶。看你的脸色说话。为了讨得你的欢心，整天低眉折腰，揣摸你的心思，瞪大眼睛，竖起耳朵，设法对你的爱好、嗜好、脾气、口味等进行摸底，然后有的放“矢”，投其所好：你爱腾云驾雾，便送上大“中华”；你的孩子要上学，送上红包表祝贺；你的寿诞到来即，跑前忙后孝过子；你好挥毫书字画，求得“宝墨”堂中挂。你觉得他好够朋友，可是那满脸的笑容后面却堆满了假意的呆板，这样的朋友是朋友吗？如果你觉得是，那他也是和你的官位是朋友。

　　或许你们都是个官，互称老朋友。你把他的小姨子调到你的“一亩三分地”吃闲饭，他把你的小舅子弄到他的麾下当“参谋”，见了面或打个电话互相致谢后，说不定你两人正算计着谁更合算，这样的朋友是朋友吗？

　　人生在世，都渴望感情的交流，渴望有亲密的朋友，可是交朋友不是一件容易的事情，选择得当则可受益匪浅，交友不当，则祸害非轻。与正直的人交朋友，自己的灵魂也能得到净化，朋友之间的一言一行相互影响，品质会随之高尚起来；与奸邪的人交朋友，必定会追风逐臭，同流合污，遭到人们的鄙弃。正所谓“近朱者赤，近墨者黑”是也。　　交友要交益友，何者为益友？凡事肯规我之过者是也。明代文学家苏竣把朋友分为四种类型：“道义相砥，过失相规，畏友也；缓急可共，死生可托，密友也；甘言如饴，游戏征逐，昵友也；和则相攘，患则相倾，贼友也。”他把“道义相砥，过失相规”列为交友的最高层次，是颇有见地的。人不可能永不犯错误，免不了要做出违背“道义”的事，这时能出来“相砥”“相规”指正你批评你甚至不惜与你脸红的人，才是你的益友，才是真朋友。

　　有位哲人说：“好朋友是山，一派尊严；好朋友是水，一脉智慧；好朋友是泥土，厚爱绵绵。”是呵，当我们寻找尊严、智慧和爱的时候，一定会遇到可以靠背、可以并肩、可以共荣辱同患难的好朋友。
</textarea></p>

<b>二、如想文本内容行左右对齐（允许标点溢出，且英文单词拆开）可用如下语句：</b>
<p><font color="#0000FF">SET_PRINT_STYLEA(0,"TextNeatRow",true);</font></p>
<input type="checkbox" id="check0">勾选本选项后再看看<input type="button" value="打印预览" name="B3"  onclick="Preview()">
<p><b>三、控制打印机自带双面打印(所谓自动双面)功能和纸张来源，可用如下语句：</b>
</p>

<p><font color="#0000FF">SET_PRINT_MODE("PRINT_DUPLEX",2);</font>2-双面 1-不双面 0-不控制</p>
<p><font color="#0000FF">SET_PRINT_MODE("PRINT_DEFAULTSOURCE",1);</font>1-纸盒  4-手动 7-自动 0-不控制</p>演示
<input type="button" value="打印预览" id="B3"  onclick="DuplexPrint()">
</p>
<p><b>四、如打印机无双面打印功能，也可手工实现，此时需如下语句（Lodop提供了暂停时间翻纸）：</b>
</p>

<p><font color="#0000FF">SET_PRINT_MODE("DOUBLE_SIDED_PRINT",true);</font></p>
<p><input type="checkbox" id="check1" value="ON" checked>选定双面打印，演示
<input type="button" value="打印预览" id="B3"  onclick="doublePreview()">或
<input type="button" value="直接打印" id="B4"  onclick="doublePrint()">
</p>
<p><a href="javascript:void(0);"  onclick="window.parent.document.getElementById('rightFrame').src='demo/gotoView.xhtml?viewId=PrintSampIndex'">&lt;&lt;回样例目录</a></p>
<script language="javascript" type="text/javascript">  
        var LODOP; //声明为全局变量 
	function Preview() {		
		CreatePrintPage();
	  	LODOP.PREVIEW();		
	};
	function Setup() {		
		CreatePrintPage();
		LODOP.PRINT_SETUP();		
	};
	function Design() {		
		CreatePrintPage();
		LODOP.PRINT_DESIGN();		
	};
	function doublePreview() {		
		CreatePrintPage();
		LODOP.SET_PRINT_MODE("DOUBLE_SIDED_PRINT",document.getElementById("check1").checked);
	  	LODOP.PREVIEW();		
	};	
	function doublePrint() {		
		CreatePrintPage();
		LODOP.SET_PRINT_MODE("DOUBLE_SIDED_PRINT",document.getElementById("check1").checked);
	  	LODOP.PRINT();		
	};
	function DuplexPrint() {		
		CreatePrintPage();
		LODOP.SET_PRINT_MODE("PRINT_DUPLEX",2);
		LODOP.SET_PRINT_MODE("PRINT_DEFAULTSOURCE",1);
	  	LODOP.PREVIEW();
	};			
	function CreatePrintPage() {
		LODOP=getLodop();  
		LODOP.PRINT_INITA(10,10,754,453,"打印控件功能演示_Lodop功能_多页文档");
		LODOP.ADD_PRINT_TEXT(21,300,151,30,"自动居中的标题\n");
		LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",2);
		LODOP.ADD_PRINT_TEXT(63,38,677,330,document.getElementById("doc1").value);
		LODOP.SET_PRINT_STYLEA(0,"FontSize",15);
		LODOP.SET_PRINT_STYLEA(0,"ItemType",4);
		LODOP.SET_PRINT_STYLEA(0,"Horient",3);
		LODOP.SET_PRINT_STYLEA(0,"Vorient",3);
		LODOP.SET_PRINT_STYLEA(0,"TextNeatRow",document.getElementById("check0").checked);
		LODOP.ADD_PRINT_LINE(53,23,52,725,0,1);
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",3);
		LODOP.ADD_PRINT_LINE(414,23,413,725,0,1);
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Horient",3);
		LODOP.SET_PRINT_STYLEA(0,"Vorient",1);
		LODOP.ADD_PRINT_TEXT(421,37,144,22,"左下脚的文本小标题");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",1);
		LODOP.SET_PRINT_STYLEA(0,"Vorient",1);
		LODOP.ADD_PRINT_TEXT(421,542,165,22,"右下脚的页号：第#页/共&页");
		LODOP.SET_PRINT_STYLEA(0,"ItemType",2);
		LODOP.SET_PRINT_STYLEA(0,"Horient",1);
		LODOP.SET_PRINT_STYLEA(0,"Vorient",1);
	};	
</script> 
</body>
</html>
