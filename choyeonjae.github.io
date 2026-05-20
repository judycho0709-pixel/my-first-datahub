<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>choyeonjae | Portfolio</title>

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

  <style>
    *{
      margin:0;
      padding:0;
      box-sizing:border-box;
      scroll-behavior:smooth;
    }

    body{
      font-family:'Poppins',sans-serif;
      background:#0f0f13;
      color:#f5f5f5;
      overflow-x:hidden;
    }

    body::before{
      content:"";
      position:fixed;
      width:700px;
      height:700px;
      background:radial-gradient(circle, rgba(255,182,193,0.15), transparent 60%);
      top:-200px;
      right:-200px;
      z-index:-1;
    }

    body::after{
      content:"";
      position:fixed;
      width:600px;
      height:600px;
      background:radial-gradient(circle, rgba(255,215,0,0.08), transparent 60%);
      bottom:-200px;
      left:-150px;
      z-index:-1;
    }

    nav{
      position:fixed;
      top:0;
      width:100%;
      padding:22px 10%;
      display:flex;
      justify-content:space-between;
      align-items:center;
      background:rgba(15,15,19,0.75);
      backdrop-filter:blur(12px);
      z-index:1000;
      border-bottom:1px solid rgba(255,255,255,0.08);
    }

    .logo{
      font-size:1.2rem;
      font-weight:700;
      letter-spacing:2px;
      color:#ffd6e7;
    }

    nav ul{
      display:flex;
      gap:30px;
      list-style:none;
    }

    nav ul li a{
      color:#eee;
      text-decoration:none;
      font-size:0.95rem;
      transition:0.3s;
    }

    nav ul li a:hover{
      color:#ffb6c1;
    }

    section{
      min-height:100vh;
      padding:120px 10%;
      display:flex;
      flex-direction:column;
      justify-content:center;
    }

    .hero{
      position:relative;
    }

    .hero h1{
      font-size:5rem;
      line-height:1;
      margin-bottom:20px;
      background:linear-gradient(to right,#ffffff,#ffcad4,#ffe08a);
      -webkit-background-clip:text;
      -webkit-text-fill-color:transparent;
    }

    .hero h2{
      font-weight:400;
      font-size:1.4rem;
      color:#cccccc;
      margin-bottom:25px;
    }

    .hero p{
      max-width:700px;
      line-height:1.9;
      color:#bbbbbb;
      font-size:1.05rem;
    }

    .btn-group{
      margin-top:40px;
      display:flex;
      gap:18px;
      flex-wrap:wrap;
    }

    .btn{
      padding:14px 28px;
      border-radius:999px;
      text-decoration:none;
      font-weight:500;
      transition:0.3s;
    }

    .primary{
      background:linear-gradient(135deg,#ffb6c1,#ffd166);
      color:#111;
    }

    .primary:hover{
      transform:translateY(-4px);
      box-shadow:0 12px 30px rgba(255,182,193,0.25);
    }

    .secondary{
      border:1px solid rgba(255,255,255,0.15);
      color:white;
      background:rgba(255,255,255,0.03);
    }

    .secondary:hover{
      background:rgba(255,255,255,0.08);
    }

    .section-title{
      font-size:2.5rem;
      margin-bottom:50px;
      position:relative;
      display:inline-block;
    }

    .section-title::after{
      content:"";
      width:60%;
      height:4px;
      border-radius:10px;
      position:absolute;
      left:0;
      bottom:-10px;
      background:linear-gradient(to right,#ffb6c1,#ffd166);
    }

    .about-grid{
      display:grid;
      grid-template-columns:1fr 1fr;
      gap:50px;
      align-items:center;
    }

    .glass{
      background:rgba(255,255,255,0.05);
      border:1px solid rgba(255,255,255,0.08);
      border-radius:28px;
      padding:35px;
      backdrop-filter:blur(10px);
    }

    .about-text{
      line-height:2;
      color:#d5d5d5;
      font-size:1rem;
    }

    .skills{
      display:flex;
      flex-wrap:wrap;
      gap:14px;
      margin-top:20px;
    }

    .skill{
      padding:10px 18px;
      border-radius:999px;
      background:rgba(255,255,255,0.06);
      border:1px solid rgba(255,255,255,0.08);
      color:#ffe3a3;
      font-size:0.9rem;
    }

    .project-card{
      margin-top:20px;
      padding:40px;
      border-radius:32px;
      background:linear-gradient(145deg, rgba(255,255,255,0.06), rgba(255,255,255,0.02));
      border:1px solid rgba(255,255,255,0.08);
      transition:0.4s;
    }

    .project-card:hover{
      transform:translateY(-8px);
      box-shadow:0 20px 40px rgba(0,0,0,0.3);
    }

    .project-tag{
      display:inline-block;
      padding:8px 16px;
      border-radius:999px;
      background:rgba(255,182,193,0.15);
      color:#ffcad4;
      margin-bottom:20px;
      font-size:0.85rem;
    }

    .project-card h3{
      font-size:2rem;
      margin-bottom:18px;
    }

    .project-card p{
      color:#d0d0d0;
      line-height:1.9;
      margin-bottom:25px;
    }

    .feature-grid{
      display:grid;
      grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
      gap:18px;
      margin-top:25px;
    }

    .feature{
      background:rgba(255,255,255,0.04);
      padding:20px;
      border-radius:20px;
      border:1px solid rgba(255,255,255,0.06);
    }

    .feature h4{
      margin-bottom:10px;
      color:#ffe08a;
    }

    .tools{
      margin-top:30px;
      color:#bbbbbb;
      line-height:1.8;
    }

    .contact{
      text-align:center;
      align-items:center;
    }

    .contact-box{
      max-width:700px;
    }

    .contact h3{
      font-size:2rem;
      margin-bottom:20px;
    }

    .contact p{
      color:#cfcfcf;
      line-height:1.9;
      margin-bottom:35px;
    }

    footer{
      text-align:center;
      padding:30px;
      color:#777;
      font-size:0.9rem;
      border-top:1px solid rgba(255,255,255,0.05);
    }

    @media(max-width:900px){

      .hero h1{
        font-size:3.5rem;
      }

      .about-grid{
        grid-template-columns:1fr;
      }

      nav{
        padding:20px 6%;
      }

      section{
        padding:120px 6%;
      }

      nav ul{
        gap:16px;
      }
    }
  </style>
</head>

<body>

  <nav>
    <div class="logo">CHOYEONJAE</div>

    <ul>
      <li><a href="#about">About</a></li>
      <li><a href="#projects">Project</a></li>
      <li><a href="#contact">Contact</a></li>
    </ul>
  </nav>

  <section class="hero">
    <h1>Fine Art<br>& Dessert Explorer</h1>

    <h2>choyeonjae · Fine Art at SKKU</h2>

    <p>
      I love arts and desserts.
      I want to eat all of the delicious desserts in the world —
      but first, in Korea.
      I explore visual culture through design, data, maps,
      and interactive storytelling.
    </p>

    <div class="btn-group">
      <a href="#projects" class="btn primary">View Project</a>
      <a href="#about" class="btn secondary">About Me</a>
    </div>
  </section>

  <section id="about">

    <h2 class="section-title">About Me</h2>

    <div class="about-grid">

      <div class="glass">
        <div class="about-text">
          I am a fine art student at Sungkyunkwan University interested in
          combining visual aesthetics with digital tools and data storytelling.
          <br><br>
          My work explores how design can transform information into emotional
          and cultural experiences.
          <br><br>
          Recently, I have been building interactive dashboards and maps inspired
          by Korea’s vibrant dessert cafe culture.
        </div>
      </div>

      <div class="glass">

        <h3 style="margin-bottom:20px;">Skills & Tools</h3>

        <div class="skills">
          <div class="skill">Fine Art</div>
          <div class="skill">Creative Direction</div>
          <div class="skill">Streamlit</div>
          <div class="skill">Plotly</div>
          <div class="skill">Folium</div>
          <div class="skill">Pandas</div>
          <div class="skill">Data Visualization</div>
          <div class="skill">UI Design</div>
          <div class="skill">HTML / CSS</div>
          <div class="skill">GitHub Pages</div>
        </div>

      </div>

    </div>

  </section>

  <section id="projects">

    <h2 class="section-title">Featured Project</h2>

    <div class="project-card">

      <div class="project-tag">
        2023313872 미술학과 조연재
      </div>

      <h3>Sweet Spots Korea</h3>

      <p>
        An interactive dessert cafe map & analytics dashboard exploring Korea’s
        dessert culture through data visualization.
        <br><br>
        Korea's dessert cafe scene is one of the most visually creative in the
        world — yet no public tool maps it by dessert type.
        This project transforms cafe data into a living cultural atlas,
        allowing users to discover cafes by region, rating, and dessert style.
      </p>

      <div class="feature-grid">

        <div class="feature">
          <h4>Interactive Map</h4>
          <p>
            Color-coded cafe pins by dessert type with live hover details.
          </p>
        </div>

        <div class="feature">
          <h4>Smart Filters</h4>
          <p>
            Filter by city, dessert category, rating, and price level.
          </p>
        </div>

        <div class="feature">
          <h4>Data Visualization</h4>
          <p>
            Bar charts, donut charts, heatmaps, and review analytics.
          </p>
        </div>

        <div class="feature">
          <h4>CSV Export</h4>
          <p>
            Download filtered cafe data for research and exploration.
          </p>
        </div>

      </div>

      <div class="tools">
        <strong>Tools & Technologies</strong><br>
        Streamlit · Plotly · Folium · Pandas · Google Maps Data · Kakao Local API
      </div>

    </div>

  </section>

  <section id="contact" class="contact">

    <div class="contact-box">

      <h2 class="section-title">Contact</h2>

      <h3>Let’s talk about art, data & desserts 🍰</h3>

      <p>
        Interested in interactive visual storytelling,
        creative coding, or dessert-inspired design?
        Feel free to connect and collaborate.
      </p>

      <a href="mailto:youremail@example.com" class="btn primary">
        Say Hello
      </a>

    </div>

  </section>

  <footer>
    © 2026 choyeonjae · Built with HTML & CSS · SKKU Fine Art
  </footer>

</body>
</html>
