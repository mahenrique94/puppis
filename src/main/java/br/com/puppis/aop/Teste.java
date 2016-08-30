package br.com.puppis.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class Teste {
	
	@Pointcut("execution(br.com.puppis.controller*.*(..)) && args(obj)")
	public void testando() {
		System.out.println("Ola AOP!");
	}

}
