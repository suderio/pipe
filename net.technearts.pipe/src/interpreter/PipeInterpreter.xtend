package interpreter

import java.math.BigDecimal
import net.technearts.pipe.pipe.And
import net.technearts.pipe.pipe.BoolConstant
import net.technearts.pipe.pipe.Comparison
import net.technearts.pipe.pipe.Equality
import net.technearts.pipe.pipe.Expression
import net.technearts.pipe.pipe.FileConstant
import net.technearts.pipe.pipe.MulOrDiv
import net.technearts.pipe.pipe.PlusOrMinus
import net.technearts.pipe.pipe.NumberConstant
import net.technearts.pipe.pipe.Or
import net.technearts.pipe.pipe.StringConstant
import net.technearts.pipe.pipe.VariableRef

class PipeInterpreter {
	def dispatch Object interpret(Expression e) {
		switch (e) {
			BoolConstant:
				Boolean.parseBoolean(e.value)
			NumberConstant:
				e.value
			StringConstant:
				e.value
			FileConstant:
				e.value
			And: {
				(e.left.interpret as Boolean) && (e.right.interpret as Boolean)
			}
			Or: {
				(e.left.interpret as Boolean) || (e.right.interpret as Boolean)
			}
			Equality: {
				val left = e.left.interpret
				val right = e.right.interpret
				if (e.op == "==" || e.op == "eq") {
					left.equals(right)
				} else {
					!left.equals(right)
				}
			}
			Comparison: {
				val left = e.left.interpret as Comparable
				val right = e.right.interpret as Comparable
				switch (e.op) {
					case ">",
					case "gt":
						left.compareTo(right) > 0
					case "<",
					case "lt":
						left.compareTo(right) < 0
					case ">=",
					case "ge":
						left.compareTo(right) >= 0
					case "<=",
					case "le":
						left.compareTo(right) <= 0
					default:
						false
				}
			}
			PlusOrMinus: {
				val left = e.left.interpret as BigDecimal
				val right = e.right.interpret as BigDecimal
				if (e.op == '+') {
					left.add(right)
				} else {
					left.subtract(right)
				}
			}
			MulOrDiv: {
				val left = e.left.interpret as BigDecimal
				val right = e.right.interpret as BigDecimal
				if (e.op == '*') {
					left.multiply(right)
				} else {
					left.divide(right)
				}
			}
			VariableRef: e.variable.expression.interpret
		}
	}
}
