package br.cin.ufpe.in1062.model;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class Greeting {

    private long id;
    private String content;

}
