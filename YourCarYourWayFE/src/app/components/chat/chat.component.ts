import { Component, OnInit } from '@angular/core';
import { ChatService } from '../../services/chat.service';
import { ChatMessage } from '../../models/chat-message';
import { ActivatedRoute } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { NgClass, NgFor } from '@angular/common';
import { isNgTemplate } from '@angular/compiler';
import { MatIconModule } from '@angular/material/icon';
import { MatButtonModule } from '@angular/material/button';
import { MatToolbarModule } from '@angular/material/toolbar';



@Component({
  selector: 'app-chat',
  standalone: true,
  imports: [FormsModule, NgFor, NgClass, MatToolbarModule, MatIconModule, MatButtonModule],
  templateUrl: './chat.component.html',
  styleUrl: './chat.component.scss'
})
export class ChatComponent implements OnInit {

  messageInput: string = '';
  userId: string = '';
  messageList: any[] = [];


  constructor(private chatService: ChatService, private route: ActivatedRoute) {

  }

  ngOnInit(): void {
    this.chatService.joinRoom("your-car_your_way-chat-test");
    this.userId = this.route.snapshot.params['userId'];
    this.lisenerMessage();
  }
  getUserRole(): string {
    if (this.userId === 'user') {
      return 'user';
    } else if (this.userId === 'admin') {
      return 'admin';
    } else {
      return this.userId;
    }
  }


  sendMessage() {
    const chatMessage = {
      message: this.messageInput,
      user: this.userId
    } as ChatMessage;

    this.chatService.sendMessage("your-car_your_way-chat-test", chatMessage);
    this.messageInput = '';
  }

  lisenerMessage() {
    this.chatService.getMessageSubject().subscribe((messages: any) => {
      this.messageList = messages.map((item: any) => ({
        ...item,
        message_side: item.user === this.userId ? 'sender' : 'receiver'

      }));
    });
  }
}
