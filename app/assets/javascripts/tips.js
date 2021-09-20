// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

Tips = {};

Tips.removeTipCard = function(tipID) {
    document.getElementById("tip-"+tipID).parentElement.remove();
};