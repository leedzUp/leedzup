
            {* MENU MOBILE *}
            <!-- Menu burger -->
            <div id="menu-burger" class="header-container d-block d-xl-none d-flex justify-content-between align-items-center">
                <div class="header-left menu-burger">
                <button id="btn-menu-burger" aria-label="menu-burger" class="btn-menu" type="button"
                    data-bs-toggle="offcanvas" data-bs-target="#offcanvasMenu" aria-controls="offcanvasMenu">
                    <svg width="35px" height="35px" xmlns="http://www.w3.org/2000/svg" data-name="menu"
                    viewBox="0 0 25 16.02">
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
                        <line class="cls-burger" y1=".38" x2="21" y2=".38" />
                        <line class="cls-burger" x1="2" y1="8.01" x2="23" y2="8.01" />
                        <line class="cls-burger" x1="4" y1="15.64" x2="25" y2="15.64" />
                        </g>
                    </g>
                    </svg>
                </button>
                </div>

                <!-- Panneau Offcanvas principal -->
                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasMenu" aria-labelledby="offcanvasMenuLabel">
                    <div class="offcanvas-header">
                        {widget name="ps_languageselector"}
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <p class="main-title-mobile mb-4">{l s="OUR<br />COLLECTION" d="Modules.Codemyshop.Block_menu"}</p>
                        <ul class="list-unstyled"><li>
                                    <a class="title-mobile" href="" class="text-decoration-none">
                                    
                                    </a><li><li>
                                    <a class="title-mobile" href="" class="text-decoration-none">
                                    
                                    </a><li><li>
                                    <a class="title-mobile" href="" class="text-decoration-none">
                                    
                                    </a><li>
                        <li>User icon</li>
                            </ul>
                    </div>
                </div>
                <!-- FIN Panneau Offcanvas principal --></div>{* END MENU MOBILE *}