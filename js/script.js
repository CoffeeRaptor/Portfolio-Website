// Typing Effect in Hero Section
const typedTextSpan = document.getElementById('typed-text');
const cursorSpan = document.getElementById('cursor');

const textArray = ["DevOps/Platform Engineer", "Coffee Addict"];
const typingDelay = 50;
const erasingDelay = 50;
const newTextDelay = 1000;
let textArrayIndex = 0;
let charIndex = 0;

function type() {
    if (charIndex < textArray[textArrayIndex].length) {
        typedTextSpan.textContent +=
            textArray[textArrayIndex].charAt(charIndex);
        charIndex++;
        setTimeout(type, typingDelay);
    } else {
        setTimeout(erase, newTextDelay);
    }
}

function erase() {
    if (charIndex > 0) {
        typedTextSpan.textContent =
            textArray[textArrayIndex].substring(0, charIndex - 1);
        charIndex--;
        setTimeout(erase, erasingDelay);
    } else {
        textArrayIndex =
            (textArrayIndex + 1) % textArray.length;
        setTimeout(type, typingDelay + 500);
    }
}

document.addEventListener("DOMContentLoaded", () => {
    if (textArray.length)
        setTimeout(type, newTextDelay + 250);
});

// Navbar Scroll Effect
window.addEventListener('scroll', () => {
    const navbar = document.getElementById('navbar');
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});

// Mobile Menu Toggle
const menuBtn = document.getElementById('menu-btn');
const mobileMenu = document.getElementById('mobile-menu');

menuBtn.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
});

// Close mobile menu when a link is clicked
const mobileMenuLinks = mobileMenu.querySelectorAll('a');

mobileMenuLinks.forEach(link => {
    link.addEventListener('click', () => {
        mobileMenu.classList.add('hidden');
    });
});

// Fun Facts Carousel - Automatic Scrolling
document.addEventListener('DOMContentLoaded', () => {
    const factCards = document.querySelector('#fact-cards > div');
    const totalFacts = factCards.children.length;
    let currentIndex = 0;

    function updateCarousel() {
        const percentage = -currentIndex * 100;
        factCards.style.transform = `translateX(${percentage}%)`;
    }

    function nextSlide() {
        currentIndex = (currentIndex + 1) % totalFacts;
        updateCarousel();
    }

    // Start the carousel
    setInterval(nextSlide, 3000); // Change slide every 3 seconds
});
