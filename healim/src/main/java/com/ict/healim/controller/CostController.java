package com.ict.healim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.NumberFormat;
import java.util.Locale;

@Controller
public class CostController {

	@RequestMapping("/cost")
	public ModelAndView cost() {
		ModelAndView mv = new ModelAndView("/cost/cost");

		return mv;
	}
	
	
    @RequestMapping("/calculate")
    public String calculate(@RequestParam("grade") int grade,
                            @RequestParam("careTime") int careTime,
                            @RequestParam("days") int days,
                            @RequestParam("extraRate") int extraRate,
                            Model model) {

        // ?“±ê¸‰ë³„ ?•œ?„?•¡ ?„¤? • (ê¸°ë³¸ê°?: 0)
        int monthlyLimit = 0;
        switch (grade) {
            case 1: monthlyLimit = 2069900; break;
            case 2: monthlyLimit = 1869600; break;
            case 3: monthlyLimit = 1455800; break;
            case 4: monthlyLimit = 1341800; break;
            case 5: monthlyLimit = 1151600; break;
        }

        // ?Œë´„ì‹œê°?, ?´?š©?¼?ˆ˜, ê°??‚°?œ¨ ?„¤? •
        int totalCost = careTime * days;
        int adjustedCost = totalCost + (totalCost * extraRate / 100);

        // ê³µë‹¨ ì§??›ê¸? ê³„ì‚°
        int supportAmount = Math.min(monthlyLimit, adjustedCost);

        // ë³¸ì¸ ë¶??‹´ê¸? ê³„ì‚°
        int userPay = adjustedCost - supportAmount;

        // ?‚¨?? ?•œ?„?•¡ê³? ì´ˆê³¼ ?—¬ë¶? ê³„ì‚°
        int remainingLimit = monthlyLimit - supportAmount;
        boolean isExceeded = adjustedCost > monthlyLimit;
        int excessAmount = adjustedCost - monthlyLimit;

        // NumberFormat?„ ?‚¬?š©?•´ 3?ë¦¬ë§ˆ?‹¤ ?‰¼?‘œ ì¶”ê?
        NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.KOREA);

        // ëª¨ë¸?— ê³„ì‚° ê²°ê³¼ ì¶”ê? (?‰¼?‘œ ?˜•?‹ ? ?š©)
        model.addAttribute("monthlyLimit", numberFormat.format(monthlyLimit));
        model.addAttribute("totalCost", numberFormat.format(totalCost));
        model.addAttribute("adjustedCost", numberFormat.format(adjustedCost));
        model.addAttribute("supportAmount", numberFormat.format(supportAmount));
        model.addAttribute("userPay", numberFormat.format(userPay));
        model.addAttribute("remainingLimit", numberFormat.format(remainingLimit));
        model.addAttribute("excessAmount", excessAmount); // ì´ˆê³¼ ê¸ˆì•¡ ì¶”ê?
        model.addAttribute("isExceeded", isExceeded);

        return "/cost/calculate"; // "cost.jsp" ë·°ë¡œ ?´?™
    }
}
