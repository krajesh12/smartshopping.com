const shopsregh1=document.querySelector('.shopsregh1');
const shopregbtn=document.getElementById('shopsregisterbtn1');
const shopsregicon=document.querySelector('.shopsregicon')


shopregbtn.addEventListener('click',()=>{
    shopsregh1.classList.add('activeregbtn');
})

shopsregicon.addEventListener('click',()=>{
     shopsregh1.classList.remove('activeregbtn');
})