let availableproducts = [
    'iphone 14 pro max',
    'samsung galaxy',
    'vivo y21',
    'oppo',
    'Branded Clothes Shop',
    'Fezi clothes Mens shop',
];

const searchbox = document.querySelector('.search-box');
const resultbox = document.querySelector('.result-box');

searchbox.onkeyup = function() {
    let result = [];
    let input = searchbox.value;
    if (input.length) {
        result = availableproducts.filter((keyword) => {
            return keyword.toLowerCase().includes(input.toLowerCase());
        });
    }
    display(result);
    if (!result.length) {
        resultbox.innerHTML = '';
    }
};

function display(result) {
    const content = result.map((list) => {
        return "<li onclick=selectInput(this)>" + list + "</li>";
    });
    resultbox.innerHTML = "<ul>" + content.join('') + "</ul>";
}

function selectInput(list) {
    const productName = list.innerHTML.trim().toLowerCase();

    const urlmapping = {
        'iphone 14 pro max': 'productcart.html',
        'branded clothes shop': 'shopprofile.html',
        'fezi clothes mens shop': 'productcart.html',
        'vivo y21': 'productcart.html',
        'samsung galaxy': 'productcart.html',
        'oppo': 'productcart.html' 
    };


    const url = urlmapping[productName];

    if (url) {
        window.location.href = url;
    } else {
        console.log('No URL mapped for this product.');
    }
}
