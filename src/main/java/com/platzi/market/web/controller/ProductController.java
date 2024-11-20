package com.platzi.market.web.controller;

import com.platzi.market.domain.Product;
import com.platzi.market.domain.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping("/all")
    public List<Product> getAllProducts() {
        return productService.findAll();
    }
    @GetMapping("/{id}")
    public Optional<Product> getProductById(@PathVariable("id") int productId) {
        return productService.getProduct(productId);
    }
    @GetMapping("/category/{id}")
    public Optional<List<Product>> getProductsByCategoryId(@PathVariable("id") int categoryId) {
        return productService.getById(categoryId);
    }

    @PostMapping("/save")
    public Product save(@RequestBody Product product) {
        return  productService.save(product);
    }

    @DeleteMapping("/delete/{id}")
    public boolean deleteProductById(@PathVariable("id") int productId) {
        return productService.delete(productId);
    }
}
