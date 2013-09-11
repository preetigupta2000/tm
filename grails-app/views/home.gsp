<html>
	<head>
		<meta name="layout" content="mainlayout"/>
	</head>
	<body>
		<div class="container maincontainer">
			<div class="row">
				<div class="span6 hidden-phone">
					<r:img dir="images" file="itime.png" class="cal-size"/>
					<div class="tm-info">
						<h3>iTime - Mobile Time Management</h3>
						<p>Ordinary people think merely of spending time. Great people think of using it.</p> 
						<p>Time is the school in which we learn, time is the fire in which we burn.</p>
					</div>					
				</div>
				<div class="offset1 span5">
					<g:render template="/templates/login"/>
				</div>		
			</div>
			<div class="row">
				<div class="span12 info-heading">
					<h1>What Level of Management are you at?</h1>
				</div>
			</div>
			<div class="row">
				<div class="span3">
						<r:img dir="images" file="the-oblivious.gif" alt="Level 1"/>
						<h5>The Oblivious</h5>									
				</div>
				<div class="span3">
						<r:img dir="images" file="the-aware.gif" alt="Level 2"/>
						<h5>Becoming Aware</h5>
				</div>
				<div class="span3">
						<r:img dir="images" file="the-proactive.gif" alt="Level 3"/>						
						<h5>Discarding The Useless</h5>
				</div>
				<div class="span3">
						<r:img dir="images" file="the-kaizen.gif"alt="kaizen"/>						
						<h5>Kaizen</h5>
				</div>
			</div>
		</div>
	</body>
</html>