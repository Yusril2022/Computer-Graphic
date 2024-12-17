const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const particles = [];

// Resize canvas
canvas.width = window.innerWidth * 0.8;
canvas.height = window.innerHeight;

// Array of butterflies
const butterflies = [];

// Generate random direction
function randomDirection() {
  return Math.random() * 2 - 1;
}

function createParticles(x, y, color) {
  for (let i = 0; i < 20; i++) {
    particles.push({
      x: x,
      y: y,
      size: Math.random() * 3 + 2,
      color: color,
      speedX: (Math.random() - 0.5) * 4,
      speedY: (Math.random() - 0.5) * 4,
      opacity: 1,
    });
  }
}

function drawParticles() {
  particles.forEach((particle, index) => {
    // Draw particle
    ctx.globalAlpha = particle.opacity;
    ctx.beginPath();
    ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
    ctx.fillStyle = particle.color;
    ctx.fill();
    ctx.closePath();
    ctx.globalAlpha = 1;

    // Update particle position
    particle.x += particle.speedX;
    particle.y += particle.speedY;
    particle.opacity -= 0.02; // Fade out

    // Remove particle when opacity is 0
    if (particle.opacity <= 0) {
      particles.splice(index, 1);
    }
  });
}

// Create a new butterfly
function createButterfly() {
  return {
    x: Math.random() * canvas.width,
    y: Math.random() * canvas.height,
    size: Math.random() * 15 + 10,
    color: `hsl(${Math.random() * 360}, 80%, 60%)`, // Random hue
    glowColor: `hsl(${Math.random() * 360}, 80%, 70%)`, // Slightly lighter for glow
    speed: Math.random() * 2 + 1,
    directionX: randomDirection(),
    directionY: randomDirection(),
    rotation: Math.random() * Math.PI, // Random initial rotation
    rotationSpeed: (Math.random() - 0.5) * 0.05, // Slight vibration
    collided: false, // Collision flag
    collisionTimer: 0, // Timer for collision effect
  };
}

// Add initial butterflies
for (let i = 0; i < 5; i++) {
  butterflies.push(createButterfly());
}

// Draw a butterfly
function drawButterfly(butterfly) {
  ctx.save();

  // Translate and rotate for individual butterfly
  ctx.translate(butterfly.x, butterfly.y);
  ctx.rotate(butterfly.rotation);

  // Draw glow effect
  if (butterfly.collided && butterfly.collisionTimer > 0) {
    ctx.shadowBlur = 20;
    ctx.shadowColor = butterfly.glowColor;
    butterfly.collisionTimer--;
  } else {
    ctx.shadowBlur = 0;
  }

 // Draw left wing
ctx.beginPath();
ctx.moveTo(0, 0);
ctx.bezierCurveTo(
  -butterfly.size * 1.2, -butterfly.size * 0.8, // Atas kiri
  -butterfly.size * 1.5, butterfly.size * 0.5, // Tengah kiri
  -butterfly.size * 0.8, butterfly.size * 1.2  // Bawah kiri
);
ctx.bezierCurveTo(
  -butterfly.size * 0.4, butterfly.size * 1.5, // Melengkung ke dalam
  -butterfly.size * 0.2, butterfly.size * 0.5, // Tengah
  0, 0
);
let gradientLeft = ctx.createRadialGradient(
  -butterfly.size * 0.8, butterfly.size * 0.5, 10,
  0, 0, butterfly.size * 1.5
);
gradientLeft.addColorStop(0, "yellow");
gradientLeft.addColorStop(1, "orange");
ctx.fillStyle = gradientLeft;
ctx.fill();
ctx.lineWidth = 2;
ctx.strokeStyle = "black";
ctx.stroke();
ctx.closePath();

// Draw right wing
ctx.beginPath();
ctx.moveTo(0, 0);
ctx.bezierCurveTo(
  butterfly.size * 1.2, -butterfly.size * 0.8, // Atas kanan
  butterfly.size * 1.5, butterfly.size * 0.5, // Tengah kanan
  butterfly.size * 0.8, butterfly.size * 1.2  // Bawah kanan
);
ctx.bezierCurveTo(
  butterfly.size * 0.4, butterfly.size * 1.5, // Melengkung ke dalam
  butterfly.size * 0.2, butterfly.size * 0.5, // Tengah
  0, 0
);
let gradientRight = ctx.createRadialGradient(
  butterfly.size * 0.8, butterfly.size * 0.5, 10,
  0, 0, butterfly.size * 1.5
);
gradientRight.addColorStop(0, "yellow");
gradientRight.addColorStop(1, "orange");
ctx.fillStyle = gradientRight;
ctx.fill();
ctx.lineWidth = 2;
ctx.strokeStyle = "black";
ctx.stroke();
ctx.closePath();


  // Draw body
  ctx.beginPath();
  ctx.arc(0, 0, butterfly.size / 4, 0, Math.PI * 2);
  ctx.fillStyle = "white";
  ctx.fill();
  ctx.closePath();

  ctx.restore();
}

// Tombol untuk mengatur kecepatan
document.getElementById("increaseSpeed").addEventListener("click", () => {
  butterflies.forEach(butterfly => {
    butterfly.speed += 0.5; // Tambah kecepatan
  });
});

document.getElementById("decreaseSpeed").addEventListener("click", () => {
  butterflies.forEach(butterfly => {
    butterfly.speed = Math.max(0.5, butterfly.speed - 0.5); // Kurangi kecepatan, minimum 0.5
  });
});

// Update positions and handle collisions
function updateButterflies() {
  butterflies.forEach((butterfly, index) => {
    // Update position
    butterfly.x += butterfly.directionX * butterfly.speed;
    butterfly.y += butterfly.directionY * butterfly.speed;

    // Update rotation
    butterfly.rotation += butterfly.rotationSpeed;

    // Bounce on edges
    if (butterfly.x <= 0 || butterfly.x >= canvas.width) butterfly.directionX *= -1;
    if (butterfly.y <= 0 || butterfly.y >= canvas.height) butterfly.directionY *= -1;

    // Check collisions with other butterflies
    for (let otherIndex = index + 1; otherIndex < butterflies.length; otherIndex++) {
      const other = butterflies[otherIndex];
      const dx = butterfly.x - other.x;
      const dy = butterfly.y - other.y;
      const distance = Math.sqrt(dx * dx + dy * dy);

      // If collision detected
      if (distance < butterfly.size * 1.5) {
        butterfly.collided = true;
        butterfly.collisionTimer = 30; // Set timer for effect
        other.collided = true;
        other.collisionTimer = 30;

        // Buat partikel di lokasi tabrakan
        createParticles(butterfly.x, butterfly.y, butterfly.glowColor);

        // Bounce effect
        butterfly.directionX *= -1;
        butterfly.directionY *= -1;
        other.directionX *= -1;
        other.directionY *= -1;
      }
    }
  });
}

// Animation loop
function animate() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);

  // Draw butterflies
  butterflies.forEach(drawButterfly);

  // Draw particles
  drawParticles();

  // Update butterfly positions
  updateButterflies();

  requestAnimationFrame(animate);
}

// Add butterfly button
document.getElementById("addButterfly").addEventListener("click", () => {
  butterflies.push(createButterfly());
});

// Handle window resize
window.addEventListener("resize", () => {
  canvas.width = window.innerWidth * 0.8;
  canvas.height = window.innerHeight;
  ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear canvas on resize
});

// Start animation
animate();

document.addEventListener("DOMContentLoaded", () => {
  const welcomePage = document.getElementById("welcomePage");
  const startButton = document.getElementById("startButton");
  const container = document.querySelector(".container");

  startButton.addEventListener("click", () => {
    // Hilangkan halaman awal
    welcomePage.classList.add("hidden");
    // Tampilkan kontainer animasi
    container.classList.remove("hidden");
  });
});