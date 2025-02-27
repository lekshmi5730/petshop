 <!-- Header-->
 <video id="background-video" autoplay loop muted 
        style="width: 100%; height: 70vh; object-fit: cover; position: relative;">
        <source src="video\vid1.mp4" type="video/mp4">
        Your browser does not support the video tag.
    </video>

    <div class="video-overlay" style="position: absolute; top: 50%; right: 0; transform: translateY(-50%); padding-right: 20px; text-align: right; color: white; width: 45vw;">
        <div class="animate-text" style="position: absolute; right: 0; animation: slideIn 2s forwards;">
            <h1 style="font-size: 2.5rem; font-weight: bold; color: black; animation: fadeIn 1s forwards; animation-delay: 0.5s; padding-left:10px;">Your Pets Deserve The Best</h1>
            <p style="font-size: 2rem; color: black; margin-bottom: 0; animation: fadeIn 1s forwards; animation-delay: 2s;">Looking for your pet's needs? Shop Now!</p>
        </div>
    </div>
    <style>
         @keyframes slideIn {
            to {
                right: 10%; /* Slide into the right corner */
            }
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }
    </style>
<!-- Section-->
<section class="py-5 dark-mode">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <?php 
                $products = $conn->query("SELECT * FROM `products` where status = 1 order by rand() limit 8 ");
                while($row = $products->fetch_assoc()):
                    $upload_path = base_app.'/uploads/product_'.$row['id'];
                    $img = "";
                    if(is_dir($upload_path)){
                        $fileO = scandir($upload_path);
                        if(isset($fileO[2]))
                            $img = "uploads/product_".$row['id']."/".$fileO[2];
                        // var_dump($fileO);
                    }
                    $inventory = $conn->query("SELECT * FROM inventory where product_id = ".$row['id']);
                    $inv = array();
                    while($ir = $inventory->fetch_assoc()){
                        $inv[$ir['size']] = number_format($ir['price']);
                    }
            ?>
            <div class="col mb-5 dark-mode">
                <div class="card h-100 product-item">
                    <!-- Product image-->
                    <img class="card-img-top w-100" src="<?php echo validate_image($img) ?>" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder"><?php echo $row['product_name'] ?></h5>
                            <!-- Product price-->
                            <?php foreach($inv as $k=> $v): ?>
                                <span><b><?php echo $k ?>: </b><?php echo $v ?></span>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center">
                            <a class="btn btn-flat btn-primary "   href=".?p=view_product&id=<?php echo md5($row['id']) ?>">View</a>
                        </div>
                        
                    </div>
                </div>
            </div>
            <?php endwhile; ?>
        </div>
    </div>
</section>

<!-- Existing Code -->


<!-- Customer Feedback Section -->
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="text-center mb-4">What Our Customers Say</h2>
        <div id="feedback-container" class="text-center">
            <!-- Placeholder for the spinner -->
            <div id="loading-spinner" style="display: none;">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
            <!-- Feedback box will be dynamically inserted here -->
        </div>
    </div>
</section>

<script>
    // Array of feedbacks
    const feedbacks = [
        { name: "John Doe", pet: "Buddy", text: "Great quality and amazing service!" },
        { name: "Jane Smith", pet: "Whiskers", text: "My pets love their new toys!" },
        { name: "Emily Brown", pet: "Max", text: "Fast delivery and excellent products." },
        { name: "Michael Johnson", pet: "Bella", text: "Highly recommend this store for pet supplies!" },
        { name: "Sarah Lee", pet: "Charlie", text: "Customer service was very helpful." },
        { name: "David Wilson", pet: "Luna", text: "Affordable and reliable." },
        { name: "Laura Adams", pet: "Daisy", text: "Love the variety of products." },
        { name: "Chris Evans", pet: "Milo", text: "Best place to shop for my furry friends!" },
        { name: "Anna White", pet: "Rocky", text: "Fantastic experience, will shop again." },
        { name: "James Taylor", pet: "Coco", text: "Products are of excellent quality." }
    ];

    // Function to show a random feedback
    function showRandomFeedback() {
        // Show the spinner
        const spinner = document.getElementById("loading-spinner");
        spinner.style.display = "block";

        // Hide the previous feedback box
        const feedbackContainer = document.getElementById("feedback-container");
        const existingFeedback = document.querySelector("#feedback-container .feedback-box");
        if (existingFeedback) {
            existingFeedback.remove();
        }

        // Simulate a loading delay
        setTimeout(() => {
            // Hide the spinner
            spinner.style.display = "none";

            // Select a random feedback
            const randomFeedback = feedbacks[Math.floor(Math.random() * feedbacks.length)];

            // Create the feedback box
            const feedbackBox = document.createElement("div");
            feedbackBox.classList.add("feedback-box", "card", "shadow", "p-3", "mx-auto", "mb-4");
            feedbackBox.style.maxWidth = "540px";
            feedbackBox.style.border = "1px solid #ddd";
            feedbackBox.style.borderRadius = "10px";
            feedbackBox.style.backgroundColor = "#fff";

            // Set the feedback content
            feedbackBox.innerHTML = `
                <div class="card-body">
                    <h5 class="card-title text-primary" style="font-weight: bold;">${randomFeedback.name} and their pet, ${randomFeedback.pet}</h5>
                    <p class="card-text text-secondary" style="font-style: italic;">"${randomFeedback.text}"</p>
                </div>
            `;

            // Append the feedback box to the container
            feedbackContainer.appendChild(feedbackBox);
        }, 1000); // Simulate a 1-second delay for loading
    }

    // Initial call to show a feedback
    showRandomFeedback();

    // Update feedback every 2 seconds
    setInterval(showRandomFeedback, 2000);
</script>

<style>
    /* Additional styling for better visual presentation */
    #feedback-container {
        margin-top: 20px;
    }

    .feedback-box {
        animation: fadeIn 1s ease-in-out;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
