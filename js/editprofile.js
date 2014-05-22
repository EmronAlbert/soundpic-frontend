function Select(obj){
		
			if(obj.style.borderColor="black "){
				obj.style.borderColor="red ";
				} 
			
				if (obj.syle.borderColor="red "){ 
				obj.style.borderColor="black "; 
			}
		}
	
	
	function limitText(limitField, limitCount, limitNum) {
		if (limitField.value.length > limitNum) {
			limitField.value = limitField.value.substring(0, limitNum);
		} else {
			limitCount.value = limitNum - limitField.value.length;
		}
	}

	function asdf(){
	var e = document.getElementById('count');
	var nr= document.getElementById('limitedtextarea').value.length;
	e.value= 200-nr;
	}
	
	  function changeImage(a) {
        document.getElementById("profilepic").src=a;
    }

		