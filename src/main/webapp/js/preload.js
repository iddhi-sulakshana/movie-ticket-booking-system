const loader = document.getElementById('preload')
document.body.style.overflowY = 'hidden'
window.addEventListener('load', async function() {
    document.body.style.overflowY = 'scroll'
    loader.remove()
})