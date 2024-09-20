
//part one code

const adsmain=document.querySelector('.adsmain');
const nextbtn=document.querySelector('.leftarrow');
const backbtn=document.querySelector('.rightarrow');

nextbtn.addEventListener('click',()=>{
    adsmain.style.scrollBehavior='smooth';
    adsmain.scrollLeft-=900;
});
backbtn.addEventListener('click',()=>{
    adsmain.style.scrollBehavior='smooth';
    adsmain.scrollLeft+=900;
});



//part two code 

const shops=document.querySelector('.shops');
const nextbtn1=document.querySelector('.leftarrow1');
const backbtn1=document.querySelector('.rightarrow1');

nextbtn1.addEventListener('click', ()=>{
shops.style.scrollBehavior='smooth';
shops.scrollLeft-=900;
})
backbtn1.addEventListener('click', ()=>{
shops.style.scrollBehavior='smooth';
shops.scrollLeft+=900;
})

//part three

const shoplist=document.querySelector('.shopslist');
const offerarrowleft=document.querySelector('.offerarrowleft');
const offerarrowright=document.querySelector('.offerarrowright');

offerarrowleft.addEventListener('click',()=>{
    shoplist.scrollLeft-=900;
    shoplist.style.scrollBehavior='smooth'*10;
});
offerarrowright.addEventListener('click',()=>{
shoplist.scrollLeft+=900;
shoplist.style.scrollBehavior='smooth';
})






//profile pic
const profileimg=document.getElementById('profileimg');
const fileupload=document.getElementById('fileupload');
fileupload.onchange=function(){
    profileimg.src=URL.createObjectURL(fileupload.files[0]);
}


function movenext(){
    window.location.href='viewall.html';
}






