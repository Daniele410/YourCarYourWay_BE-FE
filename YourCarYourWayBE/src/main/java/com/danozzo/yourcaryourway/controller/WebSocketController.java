package com.danozzo.yourcaryourway.controller;

import com.danozzo.yourcaryourway.dto.ChatMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
@Slf4j
@Controller
public class WebSocketController {
    @MessageMapping("/chat/{roomId}")
    @SendTo("/topic/{roomId}")
    public ChatMessage chat(@DestinationVariable String roomId, ChatMessage message) {
        log.info("Received message: {} , from user: {}", message.getMessage(), message.getUser());
        return new ChatMessage(message.getMessage(), message.getUser());
    }
}
