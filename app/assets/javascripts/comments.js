// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

Comments = {};

Comments.displayComment = function(comment) {
    var blockquote = document.createElement('blockquote');
    blockquote.className = 'blockquote';

    var body = document.createElement('p');
    body.className = 'mb-0';
    body.appendChild(document.createTextNode(comment.body));
    blockquote.appendChild(body);

    var footer = document.createElement('footer');
    footer.className = 'blockquote-footer';
    footer.appendChild(document.createTextNode('Added by '));

    var anchor = document.createElement('a');
    anchor.setAttribute('href', comment.href);

    var avatar = document.createElement('img');
    avatar.className = 'avatar-xs';
    avatar.setAttribute('src', comment.avatar);
    footer.appendChild(avatar);

    anchor.textContent = comment.user;
    footer.appendChild(anchor);

    footer.appendChild(document.createTextNode(' on '));
    footer.appendChild(document.createTextNode(comment.date));
    blockquote.appendChild(footer);

    var comments = document.getElementById('commentsList');
    comments.appendChild(blockquote);

    var textarea = document.getElementById('comment_body');
    textarea.value = "";
};
