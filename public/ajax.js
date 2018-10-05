function ajax() {
    console.log("ajax, kurwa?");

    var form = document.getElementsByTagName("form")[0];
    function ajaxSuccess () {
     console.log('SUCCESS');
	Turbolinks.clearCache()
	Turbolinks.visit("/games", {action: "restore"});
    }
    function sendForm (formElement) {
	if (!formElement.action) { return; }

	var xhRequest = new XMLHttpRequest();
	xhRequest.onload = ajaxSuccess;
	xhRequest.open("POST", formElement.getAttribute('action'));
	xhRequest.send(new FormData(formElement));
    }
    function onSubmit (e) {
	sendForm(form);
	e.preventDefault();
    }
    form.addEventListener(
	'submit',
	onSubmit,
	false
    );
};
document.addEventListener("turbolinks:load", ajax);
