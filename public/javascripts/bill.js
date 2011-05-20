// Javascript for the billing system

function update_balance(){
	received = $('amt_received').value;
	balance = received - total_amt;
	$('balance_amt').innerHTML = balance;
}

/*
$('amt_received').onchange(
	function(){
			alert("gOOOOO");
		}
)
*/
