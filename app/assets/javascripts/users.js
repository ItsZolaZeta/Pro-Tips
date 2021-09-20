// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


Users = {};

Users.removeUserCard = function(userID) {
    document.getElementById("user-"+userID).parentElement.remove();
};