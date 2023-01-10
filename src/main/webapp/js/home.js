const cover =  document.getElementById('hero');
window.onload = () => {
    cover.style.height = (cover.scrollHeight - nav.scrollHeight) + 'px';
}

const cards = document.querySelectorAll('.card');
cards.forEach(cardHoverEvent)
function cardHoverEvent(card){
    const cardTimeLine = gsap.timeline();
    cardTimeLine.to(card.children[1], {transform: "translateY(0%)", duration: 0.5});
    cardTimeLine.pause();
    card.addEventListener('mouseover', () => {
        cardTimeLine.play();

    })
    card.addEventListener('mouseout', () => {
        cardTimeLine.reverse();
    });
}