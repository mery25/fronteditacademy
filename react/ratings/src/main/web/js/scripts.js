function removeRatingsPainting(ratings) {
    for(var i = 0; i < ratings.length; ++i) {
        var rating = ratings[i]
        rating.firstElementChild.classList.remove('active-rating')
    }
}

function paintNode(node) {
    node.classList.add('active-rating')
}

function paintRatings(ratings, activeRating) {
    var idxActiveRating = activeRating.id.substr(7)
    for (let i = ratings.length - idxActiveRating; i >= 0; i--) {
        setTimeout(() => {
            paintNode(ratings[i].firstElementChild)
        }, (ratings.length - i) * 90)
    }
}
function initRatingsListeners(ratings) {

    for(var i = 0; i < ratings.length; ++i) {
        var rating = ratings[i]
        rating.addEventListener('click', (e) => {
            removeRatingsPainting(ratings);
            paintRatings(ratings, e.currentTarget);
        },false);
    }
}

function initDocumentListener(ratings) {

    document.addEventListener('click', (e) => {
        if (e.target.nodeName != 'A' && e.target.nodeName != 'I') {
            removeRatingsPainting(ratings)
        }
    },false);
}

function init() {
    var ratings = document.getElementsByClassName('rating');

    initRatingsListeners(ratings);
    initDocumentListener(ratings);
}

window.onload = function() {
    init();
};