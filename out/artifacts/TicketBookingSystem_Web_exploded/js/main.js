// sticky header
    const nav = document.getElementById('navbar');
    const clonenav = document.getElementById('clonenav');
    window.onscroll = () => {
        if(window.pageYOffset > (nav.scrollHeight + nav.scrollHeight - 20) && nav.classList.contains('fixed-top'))
            return;
        if(window.pageYOffset > (nav.scrollHeight + nav.scrollHeight - 20) && !nav.classList.contains('fixed-top')){
            nav.classList.add('fixed-top');
            clonenav.style.display = "block"
            return;
        }
        else {
            nav.classList.remove('fixed-top');
            clonenav.style.display = "none"
        }
    };
    window.onload = () => {
        if(window.pageYOffset > (nav.scrollHeight + nav.scrollHeight - 20) && !nav.classList.contains('fixed-top')){
            nav.classList.add('fixed-top');
            clonenav.style.display = "block"
            return;
        }
    }
    clonenav.style.height = nav.scrollHeight + 'px';
    
// header search
    const searchBtn = document.querySelector(".search-btn");
    const cancelBtn = document.querySelector(".cancel-btn");
    const searchBox = document.querySelector(".search-box");
    const inputBox = document.querySelector(".inputbox");

    inputBox.addEventListener("blur", () => {
        searchBtn.click();
    });

    searchBtn.onclick = () => {
        if(searchBox.classList.contains("active")){
          searchBox.classList.remove("active");
          searchBtn.classList.remove("close");
          searchBtn.innerHTML = '<i class="fa-light fa-search"></i>';
          return;
        }           
        inputBox.focus();
        searchBtn.innerHTML = '<i class="fa-light fa-x"></i>';
        searchBtn.classList.add("close");
        searchBox.classList.add("active");
    }

// header loading
    const loadingbar = document.querySelector(".loading-bar");
    function loading(){
        var tl = gsap.timeline({repeat: 0, repeatDelay: 0.5, onComplete: () => {
            loadingbar.style.display = "none"
        }, onStart: () => {
            loadingbar.style.display = "inline"
        }});
        tl.to(loadingbar, {left: 0, right: "auto", duration: 0, ease:Power4.easeIn});
        tl.to(loadingbar, {width: "100%", duration: 1});
        tl.to(loadingbar, {right: 0, left: "auto", duration: 0, ease:Power4.easeOut});
        tl.to(loadingbar, {width: "0", duration: 1});
    }
    loading();