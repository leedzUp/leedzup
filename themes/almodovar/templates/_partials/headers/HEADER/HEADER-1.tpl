

            
            <div class="" id="HEADER_top" data-drop-zone="top">
                {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-top-1.tpl"}
            </div>
            {if Context::getContext()->detectDeviceByUserAgent() != "mobile"}
                <div class="container-fluid mt-2 mb-2 ">
                    <div class="row">
                        <div class=" col-12 col-md-4 d-flex align-items-center gap-5" id="HEADER_left" data-drop-zone="left">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-left-1.tpl"}
                        </div>
                        <div class="col-12 col-md-4 d-flex align-items-center" id="HEADER_center" data-drop-zone="center">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-center-1.tpl"}
                        </div>
                        <div class=" col-12 col-md-4 gap-4 d-flex align-items-center justify-content-end" id="HEADER_right" data-drop-zone="right">
                            {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-right-1.tpl"}
                        </div>
                    </div>
                </div>
             {/if}

                <div class="" id="HEADER_bottom" data-drop-zone="bottom">
                {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/{$language.id}-HEADER-bottom-1.tpl"}
                </div>
            {block name="hook_before_body_closing_tag"}
                  {include file="{$smarty.const._PS_THEME_DIR_}templates/_partials/headers/HEADER/HEADER-1-script.tpl"}
        {if Context::getContext()->detectDeviceByUserAgent() == "mobile"}
        <script>
        document.addEventListener("DOMContentLoaded", function () {

            const button = document.getElementById("btn-menu-burger");
            const offcanvasElement = document.getElementById("offcanvasMenu");

                if (!button) {
                    console.error("Button not found.");
                    return;
                }
                // Function to update the burger icon based on the state (open/close)
                function updateBurgerIcon(isActive) {
                        const svgElement = button.querySelector("svg");
                        const newSvg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
                        newSvg.setAttribute("width", "35px");
                        newSvg.setAttribute("height", "35px");
                        newSvg.setAttribute("xmlns", "http://www.w3.org/2000/svg");
                        newSvg.setAttribute("viewBox", "0 0 25 16.02");
                        if (isActive) {
                        // Icon for the menu open state
                        newSvg.innerHTML = `
                            <defs>
                            <style>
                                .cls-1-menu-mobile-open {
                                fill: none;
                                stroke: #4c4c4c;
                                stroke-miterlimit: 10;
                                stroke-width: .75px;
                                }
                            </style>
                            </defs>
                            <g id="menu_mobile_open_Calque_1-2" data-name="Calque 1">
                            <g>
                                <path class="cls-1-menu-mobile-open" d="M.12,1.18c8.18-2.8,13.88,2.86,21,0"/>
                                <path class="cls-1-menu-mobile-open" d="M2.12,9.18c8.18-2.8,13.88,2.86,21,0"/>
                                <path class="cls-1-menu-mobile-open" d="M4.12,16.18c8.18-2.8,13.88,2.86,21,0"/>
                            </g>
                            </g>
                        `;
                        } else {
                        // Icon for the menu closed state (burger)
                        newSvg.innerHTML = `
                            <defs>
                            <style>
                                .cls-burger {
                                fill: none;
                                stroke: #4c4c4c;
                                stroke-miterlimit: 10;
                                stroke-width: .75px;
                                }
                            </style>
                            </defs>
                            <g data-name="menu">
                            <g>
                                <line class="cls-burger" y1=".38" x2="21" y2=".38"></line>
                                <line class="cls-burger" x1="2" y1="8.01" x2="23" y2="8.01"></line>
                                <line class="cls-burger" x1="4" y1="15.64" x2="25" y2="15.64"></line>
                            </g>
                            </g>
                        `;
                        }

                        // Replace the old SVG with the new one
                        if (svgElement) {
                        svgElement.remove();
                        }
                        button.appendChild(newSvg);
                }

                    // Event listener for the burger button
                    button.addEventListener("click", function () {
                        const isActive = button.getAttribute("data-active") === "true";

                        toggleOffcanvas(offcanvasElement, !isActive);


                        updateBurgerIcon(!isActive);
                        button.setAttribute("data-active", (!isActive).toString());
                    });

                     function toggleOffcanvas(offcanvasElement, isVisible) {
                        if (isVisible) {
                            offcanvasElement.classList.add("show");
                            offcanvasElement.setAttribute("aria-hidden", "false");
                            document.body.classList.add("body-no-scroll"); // Disable scrolling
                        } else {
                            offcanvasElement.classList.remove("show");
                            offcanvasElement.setAttribute("aria-hidden", "true");
                            document.body.classList.remove("body-no-scroll"); // Enable scrolling

                        }
                    }

                    // Manage secondary offcanvas
        const secondaryButtons = document.querySelectorAll("[data-bs-target]");
        secondaryButtons.forEach((button) => {
            button.addEventListener("click", function (event) {
                event.preventDefault(); // Prevent any default behavior

                const targetId = button.getAttribute("data-bs-target").replace("#", "");
                const targetOffcanvas = document.getElementById(targetId);

                if (targetOffcanvas) {
                    toggleOffcanvas(targetOffcanvas, true);
                            document.body.classList.add("body-no-scroll"); // Disable scrolling

                    // Add close button functionality for the secondary offcanvas
                    const closeButton = targetOffcanvas.querySelector("[data-bs-dismiss]");
                    if (closeButton) {
                        closeButton.addEventListener("click", function () {
                            toggleOffcanvas(targetOffcanvas, false);
                                                        document.body.classList.remove("body-no-scroll"); // Enable scrolling

                        });
                    }
                }
            });
        });

                    function checkOffcanvasState() {
                        const isActive = offcanvasElement.classList.contains("show");
                        updateBurgerIcon(isActive); 
                        button.setAttribute("data-active", isActive.toString());
                    }

                    checkOffcanvasState();

                    // Watch for changes in the offcanvas class list (to detect opening/closing)
                    const observer = new MutationObserver(checkOffcanvasState);
                    observer.observe(offcanvasElement, { attributes: true, classList: true });


                    const accordionButtons = document.querySelectorAll(".accordion-button");

    accordionButtons.forEach(button => {
        button.addEventListener("click", function () {
            const target = document.querySelector(button.getAttribute("data-bs-target"));

            // Si un autre élément est ouvert, le fermer (optionnel, pour un comportement exclusif)
            document.querySelectorAll(".accordion-collapse.show").forEach(openItem => {
                if (openItem !== target) {
                    openItem.classList.remove("show");
                    openItem.previousElementSibling.setAttribute("aria-expanded", "false");
                    openItem.previousElementSibling.classList.add("collapsed");
                }
            });

            const isExpanded = button.getAttribute("aria-expanded") === "true";
            if (isExpanded) {
                target.classList.remove("show");
                button.setAttribute("aria-expanded", "false");
                button.classList.add("collapsed");
            } else {
                target.classList.add("show");
                button.setAttribute("aria-expanded", "true");
                button.classList.remove("collapsed");
            }
        });
    });

                    });
                    </script>
                    {/if}
            {/block}
            