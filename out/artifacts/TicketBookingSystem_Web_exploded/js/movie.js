const playbtn = document.querySelector('.play-btn');
const videowrapper = document.querySelector('.video-wrapper');
const videowrapperTl = gsap.timeline()
const iframesrc = videowrapper.children[0].src
videowrapperTl.to(videowrapper, {opacity: 1, display: 'block', duration: 0.8})
videowrapperTl.pause();
playbtn.onclick = () => {
    if(playbtn.children[0].classList.contains('fa-play')){
        videowrapperTl.play();
        const symbol = iframesrc.indexOf("?") > -1 ? "&" : "?";
        videowrapper.children[0].src = iframesrc + symbol + 'autoplay=1'
        playbtn.children[0].classList.remove('fa-play')
        playbtn.children[0].classList.add('fa-x')
    }
    else {
        videowrapper.children[0].src = iframesrc
        videowrapperTl.reverse();
        playbtn.children[0].classList.remove('fa-x')
        playbtn.children[0].classList.add('fa-play')
    }
}