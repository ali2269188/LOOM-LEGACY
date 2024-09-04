ROLES=(
  "ceos"
  "chairmen"
  "board_members"
  "directors"
  "shareholders"
  "investors"
  "cfo"
  "accountants"
  "financial_analysts"
  "hr_managers"
  "recruitment_specialists"
  "training_and_development_officers"
  "sales_managers"
  "marketing_managers"
  "sales_representatives"
  "customer_relations_managers"
  "production_managers"
  "production_planners"
  "shift_supervisors"
  "machine_operators"
  "quality_control_inspectors"
  "r_and_d_managers"
  "textile_technologists"
  "research_scientists"
  "textile_designers"
  "cad_designers"
  "pattern_makers"
  "colorists"
  "it_managers"
  "systems_administrators"
  "software_developers"
  "maintenance_managers"
  "electrical_engineers"
  "mechanical_engineers"
  "maintenance_technicians"
  "procurement_managers"
  "supply_chain_coordinators"
  "purchasing_officers"
  "logistics_managers"
  "warehouse_supervisors"
  "distribution_coordinators"
  "compliance_managers"
  "environmental_specialists"
  "safety_officers"
  "customer_service_managers"
  "order_processors"
  "customer_support_representatives"
  "inventory_controllers"
  "demand_planners"
  "office_managers"
  "administrative_assistants"
  "receptionists"
)

BASE_DIR="/home/ali-ishaq/LOOM-LEGACY/app/views/dashboards"

# Function to convert role name to singular form
singularize() {
  local role=$1
  case "$role" in
    "ceos") echo "ceo" ;;
    "chairmen") echo "chairman" ;;
    "board_members") echo "board_member" ;;
    "directors") echo "director" ;;
    "shareholders") echo "shareholder" ;;
    "investors") echo "investor" ;;
    "accountants") echo "accountant" ;;
    "financial_analysts") echo "financial_analyst" ;;
    "hr_managers") echo "hr_manager" ;;
    "recruitment_specialists") echo "recruitment_specialist" ;;
    "training_and_development_officers") echo "training_and_development_officer" ;;
    "sales_managers") echo "sales_manager" ;;
    "marketing_managers") echo "marketing_manager" ;;
    "sales_representatives") echo "sales_representative" ;;
    "customer_relations_managers") echo "customer_relations_manager" ;;
    "production_managers") echo "production_manager" ;;
    "production_planners") echo "production_planner" ;;
    "shift_supervisors") echo "shift_supervisor" ;;
    "machine_operators") echo "machine_operator" ;;
    "quality_control_inspectors") echo "quality_control_inspector" ;;
    "r_and_d_managers") echo "r_and_d_manager" ;;
    "textile_technologists") echo "textile_technologist" ;;
    "research_scientists") echo "research_scientist" ;;
    "textile_designers") echo "textile_designer" ;;
    "cad_designers") echo "cad_designer" ;;
    "pattern_makers") echo "pattern_maker" ;;
    "colorists") echo "colorist" ;;
    "it_managers") echo "it_manager" ;;
    "systems_administrators") echo "systems_administrator" ;;
    "software_developers") echo "software_developer" ;;
    "maintenance_managers") echo "maintenance_manager" ;;
    "electrical_engineers") echo "electrical_engineer" ;;
    "mechanical_engineers") echo "mechanical_engineer" ;;
    "maintenance_technicians") echo "maintenance_technician" ;;
    "procurement_managers") echo "procurement_manager" ;;
    "supply_chain_coordinators") echo "supply_chain_coordinator" ;;
    "purchasing_officers") echo "purchasing_officer" ;;
    "logistics_managers") echo "logistics_manager" ;;
    "warehouse_supervisors") echo "warehouse_supervisor" ;;
    "distribution_coordinators") echo "distribution_coordinator" ;;
    "compliance_managers") echo "compliance_manager" ;;
    "environmental_specialists") echo "environmental_specialist" ;;
    "safety_officers") echo "safety_officer" ;;
    "customer_service_managers") echo "customer_service_manager" ;;
    "order_processors") echo "order_processor" ;;
    "customer_support_representatives") echo "customer_support_representative" ;;
    "inventory_controllers") echo "inventory_controller" ;;
    "demand_planners") echo "demand_planner" ;;
    "office_managers") echo "office_manager" ;;
    "administrative_assistants") echo "administrative_assistant" ;;
    "receptionists") echo "receptionist" ;;
    *) echo "$role" ;;
  esac
}

for role in "${ROLES[@]}"; do
  singular_role=$(singularize "$role")
  display_role=$(echo "$role" | tr '_' ' ' | sed 's/\b\(.\)/\u\1/g')

  # Create the show page file
  cat <<EOF > "${BASE_DIR}/${singular_role}.html.erb"
 <%= stylesheet_link_tag 'dashboard', media: 'all', 'data-turbolinks-track': 'reload' %>
    <nav class="navbar">
      
      <h3 class="navbar-title">LOOMS-LEGACY</h3>
      <h2>${singular_role}</h2>
      <div class="navbar-icons">
        <button id="close-btn" onclick="closeCamera()" aria-label="Close Camera"
          style="display: none; position: absolute; top: 10px; left: 10px;">Close</button>
        <a href="javascript:void(0);" onclick="openCamera()"
          aria-label="Camera">
          <div style="position: relative; width: 100%; height: auto;">

            <video id="camera-stream" autoplay
              style="width: 100%; height: auto; display: none;"></video>
          </div>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-calendar-month" viewBox="0 0 16 16">
  <path d="M2.56 11.332 3.1 9.73h1.984l.54 1.602h.718L4.444 6h-.696L1.85 11.332zm1.544-4.527L4.9 9.18H3.284l.8-2.375zm5.746.422h-.676V9.77c0 .652-.414 1.023-1.004 1.023-.539 0-.98-.246-.98-1.012V7.227h-.676v2.746c0 .941.606 1.425 1.453 1.425.656 0 1.043-.28 1.188-.605h.027v.539h.668zm2.258 5.046c-.563 0-.91-.304-.985-.636h-.687c.094.683.625 1.199 1.668 1.199.93 0 1.746-.527 1.746-1.578V7.227h-.649v.578h-.019c-.191-.348-.637-.64-1.195-.64-.965 0-1.64.679-1.64 1.886v.34c0 1.23.683 1.902 1.64 1.902.558 0 1.008-.293 1.172-.648h.02v.605c0 .645-.423 1.023-1.071 1.023m.008-4.53c.648 0 1.062.527 1.062 1.359v.253c0 .848-.39 1.364-1.062 1.364-.692 0-1.098-.512-1.098-1.364v-.253c0-.868.406-1.36 1.098-1.36z"/>
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
</svg>
        </a>
        <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" class="dropdown-icon" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5zM3 3H2v1h1z"/>
        <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1z"/>
        <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5zM2 7h1v1H2zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm1 .5H2v1h1z"/>
      </svg></button>

<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasRightLabel">Setting</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
  <button class="btn btn-primary w-100" type="button">Button</button>
  <button class="btn btn-primary w-100" type="button">Button</button>
  
  <!-- Logout button -->
  <%= button_to 'Logout', destroy_${singular_role}_session_path, method: :delete, class: "btn btn-primary w-100" %>
  
  <!-- Edit Profile button styled as a button using link_to -->
  <%= link_to 'Edit Profile', edit_${singular_role}_registration_path, class: "btn btn-primary w-100" %>
  </div>
</div>

          </ul>
        </div>
      </div>
    </nav>
    <div class="d-grid gap-2">
      <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas"
        data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
          fill="currentColor" class="bi bi-person-plus-fill"
          viewBox="0 0 16 16">
          <path
            d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6" />
          <path fill-rule="evenodd"
            d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5" />
        </svg> VIEW LOGS </button>
    </div>

    <div class="offcanvas offcanvas-start" data-bs-scroll="true"
      data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling"
      aria-labelledby="offcanvasScrollingLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasScrollingLabel">CHATSPHERE</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
          aria-label="Close"></button>
      </div>
      

      <div class="offcanvas-body">
    


        <div class="list-group">
          <ul style="list-style: none; padding-left: 0; margin-left: 0;">
            
            <div class="info">
              <h5 class="mb-1"><b>/b></h5>
            </div>
            
          </ul>
        </div>
      </div>
    </div>

    <h1 style="text-align: center; font-size: 70px; padding-top: 55px;">WELCOME BACK<br> TO LOOMS LEGACY</h1>
<p style="text-align: center; font-size: 40px; padding-top: 55px;">You’re all set for today. Check out your key tasks, latest updates, and any important announcements. Let’s make today a productive one!<p>


    <footer class="footer">
      <div class="footer-icons">
        <a href="https://example.com/facebook" target="_blank"
          aria-label="Facebook">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-data" viewBox="0 0 16 16">
  <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z"/>
  <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"/>
  <path d="M10 7a1 1 0 1 1 2 0v5a1 1 0 1 1-2 0zm-6 4a1 1 0 1 1 2 0v1a1 1 0 1 1-2 0zm4-3a1 1 0 0 0-1 1v3a1 1 0 1 0 2 0V9a1 1 0 0 0-1-1"/>
</svg>
          <span>REPORTS</span>
        </a>
        <a href="https://example.com/facebook" target="_blank"
          aria-label="Facebook">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
  <path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73z"/>
</svg>
          <span>FINANCIAL OVERVIEW</span>
        </a>
        <a href="https://example.com/facebook" target="_blank"
          aria-label="Facebook">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5zM3 3H2v1h1z"/>
  <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1z"/>
  <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5zM2 7h1v1H2zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm1 .5H2v1h1z"/>
</svg>
          <span>TODAYS tASKS</span>
        </a>
        <a href="https://example.com/facebook" target="_blank"
          aria-label="Facebook">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2m.995-14.901a1 1 0 1 0-1.99 0A5 5 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901"/>
</svg>
          <span>NOTIFICATIONS</span>
        </a>
      </div>
    </footer>
    <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <script>
document.addEventListener('DOMContentLoaded', function() {
  const dropdownToggle = document.getElementById('dropdownToggle');
  const dropdownMenu = document.getElementById('dropdownMenu');

  dropdownToggle.addEventListener('click', function(event) {
    event.stopPropagation(); // Prevent click event from closing the dropdown immediately
    const isVisible = dropdownMenu.style.display === 'block';
    dropdownMenu.style.display = isVisible ? 'none' : 'block';
    adjustDropdownPosition();
  });

  document.addEventListener('click', function(event) {
    if (!dropdownToggle.contains(event.target) && !dropdownMenu.contains(event.target)) {
      dropdownMenu.style.display = 'none';
    }
  });

  function adjustDropdownPosition() {
    const rect = dropdownMenu.getBoundingClientRect();
    const isOverflowingLeft = rect.left < 0;
    const isOverflowingRight = rect.right > window.innerWidth;
    
    if (isOverflowingLeft) {
      dropdownMenu.style.left = '0'; // Reset position to keep it within screen
      dropdownMenu.style.right = '0'; // Align to the right edge of the dropdown container
    } else if (isOverflowingRight) {
      dropdownMenu.style.left = 'auto';
      dropdownMenu.style.right = '0'; // Ensure it stays within the right edge of the viewport
    } else {
      dropdownMenu.style.left = '0'; // Default positioning
      dropdownMenu.style.right = 'auto';
    }
  }
});
function openCamera() {
  navigator.mediaDevices.getUserMedia({ video: true })
    .then(function(stream) {
      const video = document.getElementById('camera-stream');
      const closeButton = document.getElementById('close-btn');
      video.style.display = 'block'; // Show the video element
      closeButton.style.display = 'block'; // Show the close button
      video.srcObject = stream; // Display the camera stream
    })
    .catch(function(err) {
      console.error("Error: " + err);
    });
}

function closeCamera() {
  const video = document.getElementById('camera-stream');
  const closeButton = document.getElementById('close-btn');
  const stream = video.srcObject;
  if (stream) {
    const tracks = stream.getTracks();
    tracks.forEach(track => track.stop());
    video.srcObject = null;
    video.style.display = 'none'; // Hide the video element
    closeButton.style.display = 'none'; // Hide the close button
  }
}

</script>

<p><%= button_to 'Logout', destroy_${singular_role}_session_path, method: :delete %></p>

EOF

  echo "Created show page for ${role} as ${role}.html.erb"
done

echo "All show pages created successfully."

