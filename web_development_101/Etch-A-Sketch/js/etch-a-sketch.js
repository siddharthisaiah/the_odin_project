$(document).ready(function() {

	createGrid(16);
	hover();

	// Reset grid size to default 16x16 when #reset is clicked
	$('#reset').click(function(){
		createGrid(16);
		hover();
	});

	$('#userGen').click(function(){
		var side = parseInt(prompt("Enter the size of the new grid: 1- 64"));
		
		if(side > 1 && side < 65){
			createGrid(side);
		}else if (side < 1 || side > 65) {
			alert("Please a enter a number between 1 and 64.");
		}
		
		hover();
	});

});

function hover() {
	// change the background color of the square when the mouse hovers over it
	$('.square').hover(function(){
		$(this).css('background-color', '#F12822');
	});
}

function createGrid(rowHeight){
	//clear grid
	$('.grid').empty();

	// Each grid gets rowHeight rows
	for (var i = 0; i < rowHeight; i++) {
    	$('.grid').append("<div class = 'rowley'></div>");
	}
	// Each row gets rowHeight squares
	for (var i = 0; i < rowHeight; i++) {
    	$('.rowley').append("<div class='square'></div>");
	}

	var side = 900/rowHeight;	// The width of the container is 1000px - 900px is used for the square divs
	var marginal = 100/(rowHeight*3); // The remainder 100px is used for the margin

	//set .square css properties
	$('.square').height(side);
	$('.square').width(side);
	$('.square').css('margin', marginal);
	$('.square').css('background-color', '#257235');
}