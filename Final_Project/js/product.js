
// Load selected product from localStorage
const selectedProduct = JSON.parse(localStorage.getItem('selectedProduct')) || {
    name: "Regular T-Shirts",
    price: "US$ 81.96",
    discountedPrice: "US$ 114.05",
    image: "Images/product1.jpg",
    thumbnails: [
        "Images/product1.jpg",
        "Images/product1.jpg",
        "Images/product1.jpg"
    ]
};
console.log(selectedProduct)

// Update the page with selected product data
document.querySelector('.product-info h2').textContent = selectedProduct.name;
document.querySelector('.price .original').textContent = selectedProduct.price;
document.querySelector('.price .discounted').textContent = selectedProduct.discountedPrice || '';
const mainImage = document.querySelector('.product-main-image img');
mainImage.src = selectedProduct.image;
mainImage.alt = selectedProduct.name;

// Update thumbnails (use provided thumbnails or fallback to main image)
const thumbnails = document.querySelectorAll('.product-thumbnails img');
const thumbnailImages = selectedProduct.thumbnails.length > 0 ? selectedProduct.thumbnails : [selectedProduct.image, selectedProduct.image, selectedProduct.image];
thumbnails.forEach((thumb, index) => {
    if (thumbnailImages[index]) {
        thumb.src = thumbnailImages[index];
        thumb.alt = `${selectedProduct.name} Thumbnail ${index + 1}`;
    }
});

// Thumbnail and Main Image Switching
const arrowLeft = document.querySelector('.arrow-left');
const arrowRight = document.querySelector('.arrow-right');
let currentImageIndex = 0;
const images = thumbnailImages;

function updateMainImage(index) {
    thumbnails.forEach(thumb => thumb.classList.remove('active'));
    thumbnails[index].classList.add('active');
    mainImage.src = images[index];
    currentImageIndex = index;
}

thumbnails.forEach((thumb, index) => {
    thumb.addEventListener('click', () => {
        updateMainImage(index);
    });
});

arrowLeft.addEventListener('click', () => {
    currentImageIndex = (currentImageIndex - 1 + images.length) % images.length;
    updateMainImage(currentImageIndex);
});

arrowRight.addEventListener('click', () => {
    currentImageIndex = (currentImageIndex + 1) % images.length;
    updateMainImage(currentImageIndex);
});

// Size Selection
const sizeButtons = document.querySelectorAll('.sizes button');
sizeButtons.forEach(button => {
    button.addEventListener('click', () => {
        sizeButtons.forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');
    });
});

// Color Selection
const colorSwatches = document.querySelectorAll('.colors .color');
colorSwatches.forEach(swatch => {
    swatch.addEventListener('click', () => {
        colorSwatches.forEach(s => s.classList.remove('active'));
        swatch.classList.add('active');
    });
});

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