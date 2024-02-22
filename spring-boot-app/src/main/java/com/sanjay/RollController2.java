package com.sanjay;
import java.util.Optional;
import java.util.concurrent.ThreadLocalRandom;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RollController {
    private static final Logger logger = LoggerFactory.getLogger(RollController.class);

    @GetMapping("/rolldice")
    public String index(@RequestParam("player") Optional<String> player, Model model) {
        int result = this.getRandomNumber(1, 6);
        model.addAttribute("result", result);

        if (player.isPresent()) {
            logger.info("{} is rolling the dice: {}", player.get(), result);
            model.addAttribute("player", player.get());
        } else {
            logger.info("Anonymous player is rolling the dice: {}", result);
            model.addAttribute("player", "Anonymous Player");
        }

        return "rolldice";
    }

    public int getRandomNumber(int min, int max) {
        return ThreadLocalRandom.current().nextInt(min, max + 1);
    }
}
