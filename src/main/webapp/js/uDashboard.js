const inputs = document.querySelectorAll('.form-outline input')
const edit = document.getElementById('editAcc')
const save = document.getElementById('saveAcc')
const del = document.getElementById('deleteAcc')
edit.addEventListener('click', () => {
    inputs.forEach(removeDisable)
    removeDisable(save)
    addDisable(edit)
    addDisable(del)
})
save.addEventListener('click', () => {
    inputs.forEach(addDisable)
    addDisable(save)
    removeDisable(edit)
    removeDisable(del)
})
function removeDisable(input){
    input.removeAttribute('disabled')
}
function addDisable(input){
    input.setAttribute('disabled', '');
}