package com.planichef.service;

import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.service.OpenAiService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import java.util.ArrayList;
import java.util.List;

@ApplicationScoped
public class IAReceitaService {
    
    @Inject
    private OpenAiService openAiService;

    public String gerarSugestaoReceita(String pratoPrincipal, List<String> preferencias, List<String> restricoes) {
        List<ChatMessage> messages = new ArrayList<>();
        
        String prompt = String.format(
            "Gere uma receita detalhada para %s. " +
            "Preferências: %s. " +
            "Restrições: %s. " +
            "Inclua lista de ingredientes, instruções passo a passo, tempo de preparo e porções.",
            pratoPrincipal,
            String.join(", ", preferencias),
            String.join(", ", restricoes)
        );

        messages.add(new ChatMessage("user", prompt));

        ChatCompletionRequest request = ChatCompletionRequest.builder()
            .model("gpt-3.5-turbo")
            .messages(messages)
            .temperature(0.7)
            .maxTokens(1000)
            .build();

        return openAiService.createChatCompletion(request)
            .getChoices().get(0).getMessage().getContent();
    }

    public String gerarListaCompras(List<String> receitas) {
        List<ChatMessage> messages = new ArrayList<>();
        
        String prompt = String.format(
            "Gere uma lista de compras organizada por categorias para as seguintes receitas: %s. " +
            "Agrupe os ingredientes por categoria (ex: hortifruti, laticínios, etc) e some as quantidades quando necessário.",
            String.join(", ", receitas)
        );

        messages.add(new ChatMessage("user", prompt));

        ChatCompletionRequest request = ChatCompletionRequest.builder()
            .model("gpt-3.5-turbo")
            .messages(messages)
            .temperature(0.3)
            .maxTokens(1000)
            .build();

        return openAiService.createChatCompletion(request)
            .getChoices().get(0).getMessage().getContent();
    }
} 