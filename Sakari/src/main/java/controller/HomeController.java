package Sakari.controller;

import Sakari.service.CategoriaService;
import Sakari.service.ProductoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final ProductoService productoService;
    private final CategoriaService categoriaService;

    @GetMapping({"/", "/inicio"})
    public String inicio(Model model) {
        model.addAttribute("productos", productoService.listarDisponibles());
        model.addAttribute("categorias", categoriaService.listarActivas());
        return "index";
    }

    @GetMapping("/quienes-somos")
    public String quienesSomos() {
        return "quienes-somos";
    }

    @GetMapping("/contacto")
    public String contacto() {
        return "contacto";
    }

    @GetMapping("/politicas-privacidad")
    public String politicasPrivacidad() {
        return "politicas-privacidad";
    }

    @GetMapping("/terminos-condiciones")
    public String terminosCondiciones() {
        return "terminos-condiciones";
    }
}
