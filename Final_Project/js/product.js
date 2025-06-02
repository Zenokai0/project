
const selectedProductId = localStorage.getItem('selectedProductId');
//product id and fetch from db
async function getDetail() {
    console.log(selectedProductId)
    const response = await fetch(`http://localhost:3000/get-details/${selectedProductId}`);
    const data = await response.json();
    console.log('hello');
    console.log(data[0])

    document.querySelector('.product-info h2').textContent = data[0].product_name;
    document.querySelector('.price .original').textContent = data[0].price;
    document.querySelector('.price .discounted').textContent = data[0].discountedPrice || '';
    const mainImage = document.querySelector('.product-main-image img');
    mainImage.src = 'Images/' + data[0].product_images + '.jpg';
    mainImage.alt = data[0].product_name;
    document.querySelector('.product-thumbnails img').src = 'Images/' + data[0].product_images + '.jpg';

    const sizes = data[0].size.split(' ');
    const colors = data[0].color.split(' ');

    //add all colors to display
    colors.forEach(c => {
        document.querySelector('.colors').innerHTML += `<div class="color" style="background-color:${c}"></div>`
    })
    //add all sizes to display
    sizes.forEach(s => {
        document.querySelector('.sizes').innerHTML += `<button>${s}</button>`
    })
    document.querySelector('.colors :nth-child(2)').classList.add('active'); //add active class to the first div, which is 2nd child
    document.querySelector('.sizes :nth-child(2)').classList.add('active'); //add active class to the first button, which is 2nd child

    // Color Selection
    const colorSwatches = document.querySelectorAll('.colors .color');
    colorSwatches.forEach(swatch => {
        swatch.addEventListener('click', () => {
            colorSwatches.forEach(s => s.classList.remove('active'));
            swatch.classList.add('active');
        });
    });

    // Size Selection
    const sizeButtons = document.querySelectorAll('.sizes button');
    sizeButtons.forEach(button => {
        button.addEventListener('click', () => {
            sizeButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
        });
    });


}
getDetail();
// Update the page with selected product data

// Update thumbnails (use provided thumbnails or fallback to main image)
// const thumbnails = document.querySelectorAll('.product-thumbnails img');
// const thumbnailImages = selectedProduct.thumbnails.length > 0 ? selectedProduct.thumbnails : [selectedProduct.image, selectedProduct.image, selectedProduct.image];
// thumbnails.forEach((thumb, index) => {
//     if (thumbnailImages[index]) {
//         thumb.src = thumbnailImages[index];
//         thumb.alt = `${selectedProduct.name} Thumbnail ${index + 1}`;
//     }
// });

// Thumbnail and Main Image Switching
// const arrowLeft = document.querySelector('.arrow-left');
// const arrowRight = document.querySelector('.arrow-right');
// let currentImageIndex = 0;
// const images = thumbnailImages;

// function updateMainImage(index) {
//     thumbnails.forEach(thumb => thumb.classList.remove('active'));
//     thumbnails[index].classList.add('active');
//     mainImage.src = images[index];
//     currentImageIndex = index;
// }

// thumbnails.forEach((thumb, index) => {
//     thumb.addEventListener('click', () => {
//         updateMainImage(index);
//     });
// });

// arrowLeft.addEventListener('click', () => {
//     currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
//     updateMainImage(currentImageIndex);
// });

// arrowRight.addEventListener('click', () => {
//     currentImageIndex = (currentImageIndex + 1) % images.length;
//     updateMainImage(currentImageIndex);
// });


// Quantity Selector
const quantityMinus = document.querySelector('.quantity button:nth-child(2)');
const quantityPlus = document.querySelector('.quantity button:last-child');
const quantityDisplay = document.querySelector('.quantity span');
let quantity = 1;

quantityMinus.addEventListener('click', () => {
    if (quantity > 1) {
        quantity--;
        quantityDisplay.textContent = quantity;
    }
});

quantityPlus.addEventListener('click', () => {
    quantity++;
    quantityDisplay.textContent = quantity;
});